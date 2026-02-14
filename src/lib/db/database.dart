import 'package:bela_blok/db/entities/calculator_result.dart';
import 'package:bela_blok/db/entities/game_entities.dart';
import 'package:bela_blok/db/entities/settings_entities.dart';
import 'package:bela_blok/db/migrations/db_migration.dart';
import 'package:bela_blok/db/migrations/migration_v2.dart';
import 'package:bela_blok/db/migrations/migration_v3.dart';
import 'package:bela_blok/enums/theme_mode_enum.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

  AppDatabase._internal() : super(_openConnection());

  late final List<DbMigration> _migrations = [
    MigrationV2(this),
    MigrationV3(this),
  ];

  @override
  int get schemaVersion => 3;
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {},
    onUpgrade: (migrator, from, to) async { 
      for (final migration in _migrations) {
        if (migration.version > from && migration.version <= to) {
          await migration.up(migrator);
        }
      }
    },
  );