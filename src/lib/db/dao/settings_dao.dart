import 'package:bela_blok/db/dao/base_dao.dart';
import 'package:drift/drift.dart';
import '../database.dart';

class SettingsDao extends BaseDao {
  final AppDatabase _db;

  SettingsDao(this._db) : super(_db);

  Future<SettingsTableData?> getSettings() async {
    final results = await (_db.select(_db.settingsTable)
          ..orderBy([(s) => OrderingTerm.desc(s.createdAt)])
          ..limit(1))
        .get();
    
    return results.isNotEmpty ? results.first : null;
  }
}