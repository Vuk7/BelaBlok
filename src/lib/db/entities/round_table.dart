import 'package:drift/drift.dart';
import 'game_table.dart';

class RoundTable extends Table {
  IntColumn get roundId => integer().autoIncrement()();
  IntColumn get gameId => integer().references(GameTable, #gameId)();
  IntColumn get teamCalled => integer()(); // enum Team - koji tim je zvao
  IntColumn get teamOneScore => integer().withDefault(const Constant(0))();
  IntColumn get teamTwoScore => integer().withDefault(const Constant(0))();
  IntColumn get teamOneCallAmount => integer().nullable()(); // koliko je tim 1 zvao
  IntColumn get teamTwoCallAmount => integer().nullable()(); // koliko je tim 2 zvao
  BoolColumn get isTeamOneCallSuccessful => boolean().nullable()(); // je li tim 1 uspio svoj poziv
  BoolColumn get isTeamTwoCallSuccessful => boolean().nullable()(); // je li tim 2 uspio svoj poziv
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'rounds';
}
