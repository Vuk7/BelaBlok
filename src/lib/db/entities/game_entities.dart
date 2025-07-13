import 'package:bela_blok/db/entities/base_model.dart';
import 'package:drift/drift.dart';

class GameTable extends BaseUUIDModel {
  IntColumn get teamOneScore =>
      integer().withDefault(const Constant(0)).nullable()();
  IntColumn get teamTwoScore =>
      integer().withDefault(const Constant(0)).nullable()();
  IntColumn get gameType => integer().nullable()(); // 1001, 501, etc.
  IntColumn get gameDirection => integer().nullable()();
  IntColumn get currentlyShuffling => integer().nullable()();
  IntColumn get winner => integer().nullable().nullable()();
  BoolColumn get finished =>
      boolean().withDefault(const Constant(false)).nullable()();

  @override
  String get tableName => 'games';
}

class RoundTable extends BaseUUIDModel {
  TextColumn get gameId => text().references(GameTable, #id)();
  IntColumn get teamCalled => integer().nullable()();
  IntColumn get teamOneScore =>
      integer().withDefault(const Constant(0)).nullable()();
  IntColumn get teamTwoScore =>
      integer().withDefault(const Constant(0)).nullable()();
  IntColumn get teamOneCallAmount => integer().nullable()();
  IntColumn get teamTwoCallAmount => integer().nullable()();
  BoolColumn get isTeamOneCallSuccessful => boolean().nullable()();
  BoolColumn get isTeamTwoCallSuccessful => boolean().nullable()();

  @override
  String get tableName => 'rounds';
}
