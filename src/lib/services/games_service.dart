import 'package:bela_blok/db/dao/game_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/enums/play_direction_enum.dart';

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

  Future<Game> createNewGameWithParameters({
    int? gameType,
    int? targetScore, 
    PlayDirection? playDirection
  }) async { 
    var newGame = Game(
      teamOneScore: 0,
      teamTwoScore: 0,
      gameType: gameType,
      gameDirection: targetScore,
      currentlyShuffling: 0,
      winner: null,
      finished: false,
    );
    await dao.insert(database.gameTable, newGame.toCompanion());
    
    // Fetch the latest inserted game (newest by created_at) to get the complete object with ID
    final insertedGame = await dao.getLatestGame();
    if (insertedGame != null) {
      return insertedGame.toModel();
    } else {
      // Fallback: return the original game object if we can't fetch the inserted one
      return newGame;
    }
  }

  Future<void> deleteGame(String gameId) async {
    await dao.deleteGameById(gameId);
  }
}