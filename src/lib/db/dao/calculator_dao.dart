import 'package:bela_blok/db/dao/base_dao.dart';
import '../database.dart';

class CalculatorDao extends BaseDao {
  final AppDatabase _db;

  CalculatorDao(this._db) : super(_db);

  Future<CalculatorResultTableData?> getCalculatorResultByRoundId(String roundId) async {
    return (_db.select(_db.calculatorResultTable)
      ..where((tbl) => tbl.roundId.equals(roundId)))
      .getSingleOrNull();
  }

  Future<void> insertCalculatorResult(CalculatorResultTableCompanion calculatorResult) async {
    await insert(_db.calculatorResultTable, calculatorResult);
  }

  Future<int> deleteCalculatorResultByRoundId(String roundId) async {
    return (_db.delete(_db.calculatorResultTable)
      ..where((tbl) => tbl.roundId.equals(roundId)))
      .go();
  }
}
