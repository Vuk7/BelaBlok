import 'package:bela_blok/db/entities/base_model.dart';
import 'package:bela_blok/db/entities/game_entities.dart'; 
import 'package:drift/drift.dart';

class CalculatorResultTable extends BaseUUIDModel {
  TextColumn get roundId => text().references(RoundTable, #id)();
  IntColumn get teamOneDeclarations => integer()();
  IntColumn get teamOneDeclarationsSum => integer()();
  IntColumn get teamOneFails => integer()();
  IntColumn get teamTwoDeclarations => integer()();
  IntColumn get teamTwoDeclarationsSum => integer()();
  IntColumn get teamTwoFails => integer()();
  TextColumn get selectedCards => text().nullable()(); 
  TextColumn get trumpCards => text().nullable()();    
  TextColumn get team => text().nullable()(); 
  @override
  String get tableName => 'calculator_results';
}