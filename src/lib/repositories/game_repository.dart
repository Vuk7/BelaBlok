import 'package:sqflite/sqflite.dart';

class GameRepository {
  Future<void> createTable(Database db) async {
    await db.execute(
        """CREATE TABLE IF NOT EXISTS Game(gameId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, dateTime DATETIME, teamOneScore INTEGER, teamTwoScore INTEGER, 
        gameType INTEGER, gameDirection INTEGER, currentlyShuffling INTEGER, winner INTEGER, finished BOOLEAN)""");
  }
}
