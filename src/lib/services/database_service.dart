import 'package:bela_blok/repositories/game_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<Database> _initialize() async {
    return await openDatabase(await getPath,
        onConfigure: createDatabase, version: 1);
  }

  Future<String> get getPath async {
    return p.join(await getDatabasesPath(), "bela_blok.db");
  }

  Future<void> createDatabase(Database db) async {
    await GameRepository().createTable(db);
  }
}
