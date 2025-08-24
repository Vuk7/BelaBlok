import 'package:bela_blok/db/database.dart';

class SettingsService {
  final AppDatabase db;
  SettingsService(this.db);

  Future<Map<String, dynamic>> loadRaw() async {
    final result = await db.customSelect("SELECT * FROM app_settings WHERE id = 'singleton' LIMIT 1").get();
    if (result.isNotEmpty) return result.first.data;
    await db.customStatement("INSERT OR IGNORE INTO app_settings (id, show_rules, show_help_dialog, show_game_stats, show_mi_vi_score, theme_mode) VALUES ('singleton',1,1,1,1,'light')");
    final again = await db.customSelect("SELECT * FROM app_settings WHERE id = 'singleton' LIMIT 1").get();
    return again.first.data;
  }

  Future<void> update({
    bool? showRules,
    bool? showHelpDialog,
    bool? showGameStats,
    bool? showMiViScore,
    String? themeMode,
  }) async {
    final fields = <String, dynamic>{};
    if (showRules != null) fields['show_rules'] = showRules ? 1 : 0;
    if (showHelpDialog != null) fields['show_help_dialog'] = showHelpDialog ? 1 : 0;
    if (showGameStats != null) fields['show_game_stats'] = showGameStats ? 1 : 0;
    if (showMiViScore != null) fields['show_mi_vi_score'] = showMiViScore ? 1 : 0;
    if (themeMode != null) fields['theme_mode'] = themeMode;
    if (fields.isEmpty) return;
    final setClause = fields.keys.map((k) => "$k = ?").join(',');
    await db.customStatement(
      'UPDATE app_settings SET $setClause WHERE id = '"'"'singleton'"'"'',
      fields.values.toList(),
    );
  }
}