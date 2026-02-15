import 'package:drift/drift.dart';

abstract class DbMigration {
  int get version;
  Future<void> up(Migrator m);
}
