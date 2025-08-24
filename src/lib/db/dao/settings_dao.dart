import 'package:bela_blok/db/database.dart';
import 'package:drift/drift.dart';

class SettingsDao {
  final AppDatabase _db;
  SettingsDao(this._db);

  Future<AppSetting?> getSettings() async {
    return await (_db.select(_db.appSettings)..limit(1)).getSingleOrNull();
  }

  Future<AppSetting> ensureSettings() async {
    final existing = await getSettings();
    if (existing != null) return existing;
    await _db.into(_db.appSettings).insertOnConflictUpdate(
      AppSettingsCompanion.insert(id: const Value('singleton')),
    );
    return (await (_db.select(_db.appSettings)..limit(1)).getSingle());
  }

  Future<void> updateSettings({
    bool? showRules,
    bool? showHelpDialog,
    bool? showGameStats,
    String? themeMode,
  }) async {
    final hasAny = [showRules, showHelpDialog, showGameStats, themeMode].any((e) => e != null);
    if (!hasAny) return;
    final companion = AppSettingsCompanion(
      showRules: showRules == null ? const Value.absent() : Value(showRules),
      showHelpDialog: showHelpDialog == null ? const Value.absent() : Value(showHelpDialog),
      showGameStats: showGameStats == null ? const Value.absent() : Value(showGameStats),
      themeMode: themeMode == null ? const Value.absent() : Value(themeMode),
    );
    await (_db.update(_db.appSettings)..where((t) => t.id.equals('singleton'))).write(companion);
  }
}