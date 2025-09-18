import 'package:bela_blok/db/dao/base_dao.dart';
import 'package:bela_blok/enums/theme_mode_enum.dart';
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

  Future<SettingsTableData> getOrCreateSettings() async {
    final settings = await getSettings();
    if (settings == null) {
      // Create default settings using BaseDao insert method
      final settingsCompanion = SettingsTableCompanion.insert(
        showRules: const Value(true),
        showHelpDialog: const Value(true),
        showGameStats: const Value(true),
        themeMode: Value(AppThemeMode.light.index),
      );
      
      await insert(_db.settingsTable, settingsCompanion);
      
      // Return the created settings
      final newSettings = await getSettings();
      return newSettings!;
    }
    return settings;
  }

  Future<int> updateShowRules(bool showRules) async {
    final settings = await getOrCreateSettings();
    return await update(
      _db.settingsTable, 
      _db.settingsTable.id, 
      settings.id,
      SettingsTableCompanion(showRules: Value(showRules))
    );
  }

  Future<int> updateShowHelpDialog(bool showHelpDialog) async {
    final settings = await getOrCreateSettings();
    return await update(
      _db.settingsTable, 
      _db.settingsTable.id, 
      settings.id,
      SettingsTableCompanion(showHelpDialog: Value(showHelpDialog))
    );
  }

  Future<int> updateShowGameStats(bool showGameStats) async {
    final settings = await getOrCreateSettings();
    return await update(
      _db.settingsTable, 
      _db.settingsTable.id, 
      settings.id,
      SettingsTableCompanion(showGameStats: Value(showGameStats))
    );
  }

  Future<int> updateThemeMode(AppThemeMode themeMode) async {
    final settings = await getOrCreateSettings();
    return await update(
      _db.settingsTable, 
      _db.settingsTable.id, 
      settings.id,
      SettingsTableCompanion(themeMode: Value(themeMode.index))
    );
  }
}