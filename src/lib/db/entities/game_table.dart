import 'package:drift/drift.dart';

class GameTable extends Table {
  IntColumn get gameId => integer().autoIncrement()();
  DateTimeColumn get gameDateTime => dateTime()();
  IntColumn get teamOneScore => integer().withDefault(const Constant(0))();
  IntColumn get teamTwoScore => integer().withDefault(const Constant(0))();
  IntColumn get gameType => integer()(); // 1001, 501, etc.
  IntColumn get gameDirection => integer()(); // enum PlayDirection
  IntColumn get currentlyShuffling => integer()(); // koji igrač trenutno dijeli
  IntColumn get winner => integer().nullable()(); // enum Team, nullable dok se igra ne završi
  BoolColumn get finished => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'games';
}
