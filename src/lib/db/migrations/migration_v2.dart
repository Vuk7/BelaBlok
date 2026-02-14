import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/migrations/db_migrations.dart';
import 'package:drift/drift.dart';

class MigrationV2 extends DbMigration {
  final AppDatabase db;
  MigrationV2(this.db);

  @override
  int get version => 2;

  @override
  Future<void> up(Migrator m) async {
    await m.addColumn(db.settingsTable, db.settingsTable.lockPreviousRounds);
  }
}