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
  int get schemaVersion => 5;

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
