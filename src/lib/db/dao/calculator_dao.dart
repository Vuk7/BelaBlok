import 'package:bela_blok/db/dao/base_dao.dart';
import 'package:bela_blok/db/entities/calculator_result.dart';
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

  Future<void> insertCalculatorResult(CalculatorResultTableCompanion calculatorResult) async {
    await insert(_db.calculatorResultTable, calculatorResult);
  }

  Future<int> deleteCalculatorResultByRoundId(String roundId) async {
    return deleteById(
      _db.calculatorResultTable,
      _db.calculatorResultTable.roundId,
      roundId,
    );
  }
}
