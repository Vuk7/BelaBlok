import 'package:bela_blok/db/dao/game_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/enums/play_direction_enum.dart';

class GamesService {
  final AppDatabase database;
  final GameDao dao;

  GamesService(this.database) : dao = GameDao(database);

  Future<void> createGame() async {
    var newGame = Game(teamOneScore: 20, teamTwoScore: 25);
    await dao.insert(database.gameTable, newGame.toCompanion());
  }

  Future<List<Game>> getAllGames() async {
    final gameRows = await dao.getAllGames();
    return gameRows.map((row) => row.toModel()).toList();
  }

  Future<List<Game>> getGamesPaginated({required int nextPage, required int perPage}) async {
    final gameRows = await dao.getGamesPaginated(nextPage: nextPage, perPage: perPage);
    return gameRows.map((row) => row.toModel()).toList();
  }

  Future<int> getTotalGamesCount() async {
    return await dao.getTotalGamesCount();
  }

  Future<Game?> createNewGameWithParameters({
    int? gameType,
    PlayDirection? playDirection,
    int? teamOneWins,
    int? teamTwoWins,
    int? currentlyShuffling,
  }) async {
    var newGame = Game(
      teamOneScore: 0,
      teamTwoScore: 0,
      gameType: gameType,
      gameDirection: playDirection?.index,
      currentlyShuffling: currentlyShuffling,
      winner: null,
      finished: false,
      teamOneWins: teamOneWins ?? 0,
      teamTwoWins: teamTwoWins ?? 0
    );
    await dao.insert(database.gameTable, newGame.toCompanion());
    final insertedGame = await dao.getLatestGame();
    return insertedGame?.toModel();
  }

  Future<void> deleteGame(String gameId) async {
    await dao.deleteGameById(gameId);
  }

  Future<Game?> getLatestGame() async {
    final latestGameData = await dao.getLatestGame();
    return latestGameData?.toModel();
  }

  Future<void> updateGame(Game game) async {
    final update = game.toCompanion();
    await dao.update(
      database.gameTable,
      database.gameTable.id,
      game.id!,
      update,
    );
  }

  Future<Game?> getGameById(String gameId) async {
    final data = await dao.getById(database.gameTable, database.gameTable.id, gameId);
    return data?.toModel();
  }


  Future<int> getNextStartingShuffler({int playerCount = 4}) async {
    final latestGame = await getLatestGame();
    if (latestGame == null) return 1;
    final firstShuffler = latestGame.currentlyShuffling ?? 1;
    final dir = latestGame.gameDirection ?? 0;
    if (dir == 0) {
      return (firstShuffler % playerCount) + 1;
    } else {
      final prev = firstShuffler - 1;
      return prev < 1 ? playerCount : prev;
    }
  }
  Future<int> getPreviousGameDirection() async {
    final latestGame = await getLatestGame();
    if (latestGame != null && latestGame.gameDirection != null) {
      return latestGame.gameDirection!;
    }
    
    return 0; 
  }
  Future<PlayDirection> getPreviousPlayDirection() async {
    final dirIndex = await getPreviousGameDirection();
    if (dirIndex >= 0 && dirIndex < PlayDirection.values.length) {
      return PlayDirection.values[dirIndex];
    }
    return PlayDirection.clockwise; // default
  }


  static int? determineWinner({
    required int teamOneScore,
    required int teamTwoScore,
    required int gameTargetScore,
  }) {
    final bool teamOneReached = teamOneScore >= gameTargetScore;
    final bool teamTwoReached = teamTwoScore >= gameTargetScore;

    if (!teamOneReached && !teamTwoReached) return null;

    if (teamOneReached && teamTwoReached) {
      // Both crossed the target — higher score wins
      return teamOneScore >= teamTwoScore ? 0 : 1;
    }

    return teamOneReached ? 0 : 1;
  }

  static bool isGameFinished({
    required int teamOneScore,
    required int teamTwoScore,
    required int gameTargetScore,
  }) {
    return teamOneScore >= gameTargetScore || teamTwoScore >= gameTargetScore;
  }
}