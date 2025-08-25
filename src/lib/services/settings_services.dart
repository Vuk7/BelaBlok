import 'package:bela_blok/db/dao/settings_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/user_settings_model.dart';
import 'package:bela_blok/enums/theme_mode_enum.dart';

class SettingsService {
  final AppDatabase database;
  final SettingsDao dao;

  SettingsService(this.database) : dao = SettingsDao(database);

  Future<UserSettings> fetchSettings() async {
    final settingsData = await dao.getOrCreateSettings();
    return settingsData.toModel();
  }

  Future<void> updateShowRules(bool showRules) async {
    await dao.updateShowRules(showRules);
  }

  Future<void> updateShowHelpDialog(bool showHelpDialog) async {
    await dao.updateShowHelpDialog(showHelpDialog);
  }

  Future<void> updateShowGameStats(bool showGameStats) async {
    await dao.updateShowGameStats(showGameStats);
  }

  Future<void> updateThemeMode(AppThemeMode themeMode) async {
    await dao.updateThemeMode(themeMode);
  }

  Future<void> updateSettings(UserSettings settings) async {
    final update = settings.toCompanion();
    final currentSettings = await dao.getOrCreateSettings();
    await dao.update(
      database.settingsTable,
      database.settingsTable.id,
      currentSettings.id,
      update,
    );
  }
}