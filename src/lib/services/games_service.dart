import 'package:bela_blok/db/dao/game_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';

class GamesService {
  final AppDatabase database;
  final GameDao dao;

  static GamesService? _instance;

  GamesService._(this.database, this.dao);

  static Future<GamesService> create() async {
    if (_instance != null) {
      return _instance!;
    }
    
    final db = AppDatabase();
    final dao = GameDao(db);
    _instance = GamesService._(db, dao);
    return _instance!;
  }

  static GamesService? get instance => _instance;

  Future<void> createGame() async {
    var newGame = Game(teamOneScore: 20, teamTwoScore: 25);
    await dao.insert(database.gameTable, newGame.toCompanion());
  }

  Future<List<Game>> getAllGames() async {
    final gameRows = await dao.getAllGames();
    return gameRows.map((row) => row.toModel()).toList();
  }

  Future<String> createNewGameWithParameters({
    int? gameType,
    int? targetScore, 
    bool? someOtherSetting
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
    return "game_created_successfully"; 
  }

  Future<void> deleteGame(String gameId) async {
    await dao.deleteGameById(gameId);
  }
}