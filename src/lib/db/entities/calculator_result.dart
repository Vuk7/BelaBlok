import 'package:bela_blok/db/entities/base_model.dart';
import 'package:bela_blok/db/entities/game_entities.dart'; 
import 'package:drift/drift.dart';

class CalculatorResultTable extends BaseUUIDModel {
  TextColumn get roundId => text().references(RoundTable, #id)();
  IntColumn get teamOneDeclarations => integer().nullable()();
  IntColumn get teamOneDeclarationsSum => integer().nullable()();
  IntColumn get teamOneFails => integer().nullable()();
  IntColumn get teamTwoDeclarations => integer().nullable()();
  IntColumn get teamTwoDeclarationsSum => integer().nullable()();
  IntColumn get teamTwoFails => integer().nullable()();
  TextColumn get selectedCards => text().nullable()(); 
  TextColumn get trumpCards => text().nullable()();    
  TextColumn get team => text().nullable()(); 
  @override
  String get tableName => 'calculator_results';
}