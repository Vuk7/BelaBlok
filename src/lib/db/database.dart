import 'package:bela_blok/common/constants.dart';
import 'package:bela_blok/db/entities/game_entities.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@DriftDatabase(tables: [GameTable, RoundTable])
class AppDatabase extends _$AppDatabase {
  static AppDatabase? _instance;

  factory AppDatabase() {
    _instance ??= AppDatabase._internal();
    return _instance!;
  }

  AppDatabase._internal() : super(_openConnection());


  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      for (var v = from; v < to; v++) {
        if (v == 1) {
          await migrator.addColumn(roundTable, roundTable.teamFailed);
        }
        if (v == 2) {
        }
        if (v == 3) {
          try {
            await customStatement('ALTER TABLE rounds DROP COLUMN team_one_original_score');
          } catch (_) {
          }
          try {
            await customStatement('ALTER TABLE rounds DROP COLUMN team_two_original_score');
          } catch (_) {
          }
        }
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
