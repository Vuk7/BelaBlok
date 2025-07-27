import 'package:bela_blok/db/dao/game_dao.dart';
import 'package:bela_blok/db/dao/round_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/db/models/round_model.dart';
import 'package:bela_blok/enums/play_direction_enum.dart';



class GamesService {
  final AppDatabase database;
  final GameDao dao;
  final RoundDao roundDao;

  GamesService(this.database)
      : dao = GameDao(database),
        roundDao = RoundDao(database);

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

  Future<List<RoundTableData>> getRoundsForGameSorted(String gameId) async {
    return await roundDao.getRoundsForGameSorted(gameId);
  }

  Future<void> createRound(Round round) async {
    await roundDao.insert(database.roundTable, round.toCompanion());
  }
}