import 'package:bela_blok/db/dao/base_dao.dart';
import 'package:drift/drift.dart';
import '../database.dart';

class GameDao extends BaseDao {
  final AppDatabase _db;

  GameDao(this._db) : super(_db);

  Future<List<GameTableData>> getAllGames() =>
      (_db.select(_db.gameTable)).get();

  Future<GameTableData?> getGameById(String id) =>
      (_db.select(_db.gameTable)..where((g) => g.id.equals(id)))
          .getSingleOrNull();

  Future<GameTableData?> getActiveGame() =>
      (_db.select(_db.gameTable)..where((g) => g.finished.equals(false)))
          .getSingleOrNull();

  Future<List<GameTableData>> getFinishedGames() =>
      (_db.select(_db.gameTable)..where((g) => g.finished.equals(true))).get();

  Future<List<GameTableData>> getgameTableSortedByDate() =>
      (_db.select(_db.gameTable)
            ..orderBy([(g) => OrderingTerm.desc(g.createdAt)]))
          .get();

  Future<List<GameTableData>> getGamesPaginated({required int nextPage, required int perPage}) =>
      withPagination(
        (_db.select(_db.gameTable)
              ..orderBy([(g) => OrderingTerm.desc(g.createdAt)])),
        nextPage: nextPage,
        perPage: perPage,
      ).get();

  Future<int> getTotalGamesCount() async {
    final countQuery = _db.selectOnly(_db.gameTable)..addColumns([_db.gameTable.id.count()]);
    final result = await countQuery.getSingle();
    return result.read(_db.gameTable.id.count()) ?? 0;
  }

  Future<GameTableData?> getLatestGame() =>
      (_db.select(_db.gameTable)
            ..orderBy([(g) => OrderingTerm.desc(g.createdAt)])
            ..limit(1))
          .getSingleOrNull();

  Future<int> deleteGameById(String id) =>
      deleteById(_db.gameTable, _db.gameTable.id, id);
}