import 'package:bela_blok/db/dao/base_dao.dart';
import 'package:drift/drift.dart';
import '../database.dart';

class RoundDao extends BaseDao {
  Future<int> getRoundsForGameCount(String gameId) async {
    final countExp = _db.roundTable.id.count();
    final query = _db.selectOnly(_db.roundTable)
      ..addColumns([countExp])
      ..where(_db.roundTable.gameId.equals(gameId));
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }
  final AppDatabase _db;

  RoundDao(this._db) : super(_db);

  Future<List<RoundTableData>> getAllRounds() =>
      _db.select(_db.roundTable).get();

  Future<List<RoundTableData>> getRoundsForGame(String gameId) =>
      (_db.select(_db.roundTable)..where((r) => r.gameId.equals(gameId))).get();

  Future<List<RoundTableData>> getRoundsForGameSorted(String gameId) =>
      (_db.select(_db.roundTable)
            ..where((r) => r.gameId.equals(gameId))
            ..orderBy([(r) => OrderingTerm.asc(r.createdAt)]))
          .get();

  Future<RoundTableData?> getLastRoundForGame(String gameId) =>
      (_db.select(_db.roundTable)
            ..where((r) => r.gameId.equals(gameId))
            ..orderBy([(r) => OrderingTerm.desc(r.createdAt)])
            ..limit(1))
          .getSingleOrNull();

  Future<CalculatorResultTableData?> getCalculatorResultByRoundId(String roundId) async {
    return (_db.select(_db.calculatorResultTable)
      ..where((tbl) => tbl.roundId.equals(roundId)))
      .getSingleOrNull();
  }

}
