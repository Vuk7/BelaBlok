import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/entities/base_model.dart';
import 'package:drift/drift.dart';

abstract class BaseDao<T extends BaseUUIDModel, D> {
  final AppDatabase database;

  BaseDao(this.database);

  SimpleSelectStatement<TTable, R> withPagination<TTable extends Table, R>(
    SimpleSelectStatement<TTable, R> query, {
    required int nextPage,
    required int perPage,
  }) {
    final page = nextPage <= 0 ? 1 : nextPage;
    final size = perPage <= 0 ? 10 : perPage;
    final offset = (page - 1) * size;
    return query..limit(size, offset: offset);
  }

    Future<D?> getById<Table, D>(
      TableInfo<T, D> table, Column<String> idColumn, String id) {
    return (database.select(table)..where((row) => idColumn.equals(id)))
        .getSingleOrNull();
  }

  Future<void> insert(TableInfo<T, D> table, Insertable<D> item) async {
    await database.into(table).insert(item);
  }

  Future<int> update(TableInfo<T, D> table, Column<String> idColumn, String id,
      Insertable<D> item) {
    return (database.update(table)..where((row) => idColumn.equals(id)))
        .write(item);
  }

  Future<int> deleteById(TableInfo<T, D> table, Column<String> idColumn, String id) {
    return (database.delete(table)..where((row) => idColumn.equals(id))).go();
  }
}
