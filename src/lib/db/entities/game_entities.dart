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
  IntColumn get teamOneWins =>
      integer().withDefault(const Constant(0)).nullable()();
  IntColumn get teamTwoWins =>
      integer().withDefault(const Constant(0)).nullable()();

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
  BoolColumn get teamFailed => boolean().nullable()();
  TextColumn get calculatorResult => text().nullable()();
  
  IntColumn get us20 => integer().withDefault(const Constant(0)).nullable()();
  IntColumn get us50 => integer().withDefault(const Constant(0)).nullable()();
  IntColumn get us100 => integer().withDefault(const Constant(0)).nullable()();
  IntColumn get us150 => integer().withDefault(const Constant(0)).nullable()();
  IntColumn get us200 => integer().withDefault(const Constant(0)).nullable()();
  
  IntColumn get them20 => integer().withDefault(const Constant(0)).nullable()();
  IntColumn get them50 => integer().withDefault(const Constant(0)).nullable()();
  IntColumn get them100 => integer().withDefault(const Constant(0)).nullable()();
  IntColumn get them150 => integer().withDefault(const Constant(0)).nullable()();
  IntColumn get them200 => integer().withDefault(const Constant(0)).nullable()();


  @override
  String get tableName => 'rounds';
}
