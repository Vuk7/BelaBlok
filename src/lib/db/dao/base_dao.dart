import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/entities/base_model.dart';
import 'package:drift/drift.dart';

abstract class BaseDao<T extends BaseUUIDModel, D> {
  final AppDatabase database;

  BaseDao(this.database);

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
}
