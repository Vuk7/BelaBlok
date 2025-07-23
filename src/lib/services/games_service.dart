import 'package:bela_blok/db/dao/game_dao.dart';
import 'package:bela_blok/db/dao/round_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/enums/play_direction_enum.dart';
import 'package:drift/drift.dart'; 

class GamesService {
  final AppDatabase database;
  final GameDao dao;

  GamesService._(this.database, this.dao);

  static Future<GamesService> create() async {
    final db = AppDatabase();
    final dao = GameDao(db);
    return GamesService._(db, dao);
  }

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
    int? targetScore, 
    PlayDirection? playDirection
  }) async { 
    var newGame = Game(
      teamOneScore: 0,
      teamTwoScore: 0,
      gameType: targetScore, 
      gameDirection: playDirection?.index, 
      currentlyShuffling: 0,
      winner: null,
      finished: false,
    );
    await dao.insert(database.gameTable, newGame.toCompanion());
    
    final insertedGame = await dao.getLatestGame();
    if (insertedGame != null) {
      return insertedGame.toModel();
    } else {
      return null;
    }
  }

  Future<void> deleteGame(String gameId) async {
    await dao.deleteGameById(gameId);
  }
  Future<Game?> getLatestGame() async {
    final latestGameData = await dao.getLatestGame();
    if (latestGameData != null) {
      return latestGameData.toModel();
    }
    return null;
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
    final data = await dao.getGameById(gameId);
    return data?.toModel();
  }

  Future<List<RoundTableData>> getRoundsForGameSorted(String gameId) async {
    // RoundDao koristiš samo unutar servisa!
    final roundDao = RoundDao(database);
    return await roundDao.getRoundsForGameSorted(gameId);
  }
}