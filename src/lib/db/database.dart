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
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from == 1 && to == 2) {
        
        await migrator.addColumn(roundTable, roundTable.teamFailed);
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
