import 'package:bela_blok/db/dao/settings_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/user_settings_model.dart';
import 'package:bela_blok/enums/theme_mode_enum.dart';

class SettingsService {
  final AppDatabase database;
  final SettingsDao dao;

  SettingsService(this.database) : dao = SettingsDao(database);

  Future<UserSettings> fetchSettings() async {
    final settingsModel = await dao.getOrCreateSettings();
    return UserSettings(
      id: settingsModel.id,
      showRules: settingsModel.showRules,
      showHelpDialog: settingsModel.showHelpDialog,
      showGameStats: settingsModel.showGameStats,
      themeMode: settingsModel.themeMode.index,
    );
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
    if (settings.showRules != null) {
      await dao.updateShowRules(settings.showRules!);
    }
    if (settings.showHelpDialog != null) {
      await dao.updateShowHelpDialog(settings.showHelpDialog!);
    }
    if (settings.showGameStats != null) {
      await dao.updateShowGameStats(settings.showGameStats!);
    }
    if (settings.themeMode != null) {
      await dao.updateThemeMode(AppThemeMode.values[settings.themeMode!]);
    }
  }
}