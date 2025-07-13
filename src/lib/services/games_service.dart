import 'package:bela_blok/db/dao/game_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';

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
}