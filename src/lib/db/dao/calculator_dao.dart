import 'package:bela_blok/db/dao/base_dao.dart';
import 'package:bela_blok/db/entities/calculator_result.dart';
import 'package:bela_blok/db/models/calculator.model.dart';
import '../database.dart';

class CalculatorDao extends BaseDao<CalculatorResultTable, CalculatorResultTableData> {
  final AppDatabase _db;

  CalculatorDao(this._db) : super(_db);

  Future<CalculatorResultTableData?> getCalculatorResultByRoundId(String roundId) async {
    return getById<CalculatorResultTable, CalculatorResultTableData>(
      _db.calculatorResultTable,
      _db.calculatorResultTable.roundId,
      roundId,
    );
  }

  Future<void> insertCalculatorResult(CalculatorResult calculatorResult) async {
    await insert(_db.calculatorResultTable, calculatorResult.toCompanion());
  }

  
  
}
