import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dao/game_dao.dart';
import 'dao/round_dao.dart';

part 'database.g.dart';

// Definicija GameTable
class Games extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get gameDateTime => dateTime()();
  IntColumn get teamOneScore => integer().withDefault(const Constant(0))();
  IntColumn get teamTwoScore => integer().withDefault(const Constant(0))();
  IntColumn get gameType => integer()(); 
  IntColumn get gameDirection => integer()(); 
  IntColumn get currentlyShuffling => integer()(); 
  IntColumn get winner => integer().nullable()(); 
  BoolColumn get finished => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// Definicija RoundTable
class Rounds extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameId => integer().references(Games, #id)();
  IntColumn get teamCalled => integer()(); 
  IntColumn get teamOneScore => integer().withDefault(const Constant(0))();
  IntColumn get teamTwoScore => integer().withDefault(const Constant(0))();
  IntColumn get teamOneCallAmount => integer().nullable()(); 
  IntColumn get teamTwoCallAmount => integer().nullable()(); 
  BoolColumn get isTeamOneCallSuccessful => boolean().nullable()(); 
  BoolColumn get isTeamTwoCallSuccessful => boolean().nullable()(); 
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [Games, Rounds])
class AppDatabase extends _$AppDatabase {
  // DAOs
  late final GameDao gameDao = GameDao(this);
  late final RoundDao roundDao = RoundDao(this);

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Buduće migracije
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bela_blok.db'));
    return NativeDatabase.createInBackground(file);
  });
}
