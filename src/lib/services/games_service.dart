import 'package:bela_blok/db/dao/game_dao.dart';
import 'package:bela_blok/db/dao/round_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/enums/play_direction_enum.dart';
import 'package:drift/drift.dart';


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

  Future<void> updateGame(String gameId, int noviScore1, int noviScore2, int? winner) async {
    final update = GameTableCompanion(
      teamOneScore: Value(noviScore1),
      teamTwoScore: Value(noviScore2),
      finished: const Value(true),
      winner: Value(winner),
    );
    await dao.update(
      database.gameTable,
      database.gameTable.id,
      gameId,
      update,
    );
  }

  Future<void> updateTeamScores(String gameId, int noviScore1, int noviScore2) async {
    final update = GameTableCompanion(
      teamOneScore: Value(noviScore1),
      teamTwoScore: Value(noviScore2),
    );
    await dao.update(
      database.gameTable,
      database.gameTable.id,
      gameId,
      update,
    );
  }

  Future<void> setGameWinner(String gameId, int? winner) async {
    final update = GameTableCompanion(
      winner: Value(winner),
      finished: const Value(true),
    );
    await dao.update(
      database.gameTable,
      database.gameTable.id,
      gameId,
      update,
    );
  }

  Future<void> finishGame(String gameId) async {
    const update = GameTableCompanion(
      finished: Value(true),
    );
    await dao.update(
      database.gameTable,
      database.gameTable.id,
      gameId,
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
}