import 'package:bela_blok/db/dao/game_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/enums/play_direction_enum.dart';
import 'package:bela_blok/services/rounds_service.dart';

class GamesService {
  final AppDatabase database;
  final GameDao dao;
  final RoundsService _roundsService;

  GamesService(this.database) : dao = GameDao(database), _roundsService = RoundsService(database);

  Future<void> createGame() async {
    var newGame = Game(teamOneScore: 20, teamTwoScore: 25);
    await dao.insert(database.gameTable, newGame.toCompanion());
  }

  Future<List<Game>> getAllGames() async {
    final gameRows = await dao.getAllGames();
    return gameRows.map((row) => row.toModel()).toList();
  }

  Future<Game?> createNewGameWithParameters({
    int? gameType,
    PlayDirection? playDirection,
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

  Future<Game?> getLatestUnfinishedGame() async {
    final data = await dao.getLatestUnfinishedGame();
    return data?.toModel();
  }

  Future<Game?> getGameById(String gameId) async {
    final data = await dao.getById(database.gameTable, database.gameTable.id, gameId);
    return data?.toModel();
  }


  /// [playerCount] 
  Future<int> getNextStartingShuffler({int playerCount = 4}) async {
    final latestGame = await getLatestGame();
    if (latestGame != null && latestGame.id != null) {
      final firstRound = await _roundsService.getFirstRoundForGame(latestGame.id!);
      
      if (firstRound != null && firstRound.shuffler != null) {
        final gameDirection = latestGame.gameDirection ?? 0;
        int nextShuffler;
        
        if (gameDirection == 0) {
          // Clockwise: 1->2->3->4->1
          nextShuffler = (firstRound.shuffler! % playerCount) + 1;
        } else {
          // Counter-clockwise: 1->4->3->2->1
          nextShuffler = firstRound.shuffler! - 1;
          if (nextShuffler < 1) nextShuffler = playerCount;
        }
        
        return nextShuffler;
      }
    }
    
    return 1; 
  }
  Future<int> getPreviousGameDirection() async {
    final latestGame = await getLatestGame();
    if (latestGame != null && latestGame.gameDirection != null) {
      return latestGame.gameDirection!;
    }
    
    return 0; 
  }
}