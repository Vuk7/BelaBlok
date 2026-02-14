import 'package:bela_blok/common/constants.dart';
import 'package:bela_blok/db/entities/calculator_result.dart';
import 'package:bela_blok/db/entities/game_entities.dart';
import 'package:bela_blok/db/entities/settings_entities.dart';
import 'package:bela_blok/enums/theme_mode_enum.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    GameTable,
    RoundTable, SettingsTable,
    CalculatorResultTable, 
  ]
)
class AppDatabase extends _$AppDatabase {
  static AppDatabase? _instance;

  factory AppDatabase() {
    _instance ??= AppDatabase._internal();
    return _instance!;
  }

  AppDatabase._internal() : super(_openConnection());


  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {},
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.addColumn(settingsTable, settingsTable.lockPreviousRounds);
      }
      if (from < 3) {
        await migrator.addColumn(settingsTable, settingsTable.ecoMode);
      }
    },
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
