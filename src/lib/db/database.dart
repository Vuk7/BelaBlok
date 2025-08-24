import 'package:bela_blok/common/constants.dart';
import 'package:bela_blok/db/entities/game_entities.dart';
import 'package:drift/drift.dart';
import 'package:bela_blok/db/entities/settings_entity.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@DriftDatabase(tables: [GameTable, RoundTable, AppSettings])
class AppDatabase extends _$AppDatabase {
  static AppDatabase? _instance;

  factory AppDatabase() {
    _instance ??= AppDatabase._internal();
    return _instance!;
  }

  AppDatabase._internal() : super(_openConnection());


  @override
  int get schemaVersion => 6; 

  @override
  MigrationStrategy get migration => MigrationStrategy(

    onUpgrade: (migrator, from, to) async {
      if (from < 2 && to >= 2) {
        await migrator.addColumn(roundTable, roundTable.teamFailed);
      }
      if (from < 4 && to >= 4) {
        try { await migrator.dropColumn(roundTable, 'shuffler'); } catch (_) {}
      }
      if (from < 5 && to >= 5) {
        try {
          await migrator.createTable(appSettings);
        } catch (_) {}
        await customStatement("INSERT OR IGNORE INTO app_settings (id, show_rules, show_help_dialog, show_game_stats, show_mi_vi_score, theme_mode) VALUES ('singleton', 1, 1, 1, 1, 'light')");
      }
      if (from < 6 && to >= 6) {
        try {
          await customStatement('ALTER TABLE app_settings RENAME TO app_settings_old');
          await customStatement('CREATE TABLE app_settings (id TEXT NOT NULL PRIMARY KEY, show_rules INTEGER NOT NULL DEFAULT 1, show_help_dialog INTEGER NOT NULL DEFAULT 1, show_game_stats INTEGER NOT NULL DEFAULT 1, theme_mode TEXT NOT NULL DEFAULT \'light\')');
          await customStatement('INSERT INTO app_settings (id, show_rules, show_help_dialog, show_game_stats, theme_mode) SELECT id, show_rules, show_help_dialog, show_game_stats, theme_mode FROM app_settings_old');
          await customStatement('DROP TABLE app_settings_old');
        } catch (_) {}
      }
    },
    beforeOpen: (details) async {},
  );


  static QueryExecutor _openConnection(){
    return driftDatabase(
      name: databaseName,
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory
      )
    );
  }
}
