import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/dao/settings_dao.dart';

class SettingsService {
  final SettingsDao _dao;
  SettingsService(AppDatabase db) : _dao = SettingsDao(db);

  Future<AppSetting> fetchSettings() => _dao.ensureSettings();

  Future<void> update({
    bool? showRules,
    bool? showHelpDialog,
    bool? showGameStats,
    String? themeMode,
  }) => _dao.updateSettings(
    showRules: showRules,
    showHelpDialog: showHelpDialog,
    showGameStats: showGameStats,
    themeMode: themeMode,
  );
}