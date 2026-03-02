import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/migrations/db_migration.dart';
import 'package:drift/drift.dart';

class MigrationV3 extends DbMigration {
  final AppDatabase db;
  MigrationV3(this.db);

  @override
  int get version => 3;

  @override
  Future<void> up(Migrator m) async {
    await m.addColumn(db.settingsTable, db.settingsTable.ecoMode);
  }
}
