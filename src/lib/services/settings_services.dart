import 'package:bela_blok/db/dao/settings_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/user_settings_model.dart';
import 'package:bela_blok/enums/round_sort_order_enum.dart';
import 'package:bela_blok/enums/theme_mode_enum.dart';

class SettingsService {
  final AppDatabase database;
  final SettingsDao dao;

  SettingsService(this.database) : dao = SettingsDao(database);

  Future<UserSettings> fetchSettings() async {
    final settingsData = await dao.getSettings();
    if (settingsData == null) {
      final settings = UserSettings(
        showRules: false,
        showHelpDialog: false,
        showGameStats: true,
        showSmartCalculator: false,
        lockPreviousRounds: false,
        themeMode: AppThemeMode.light.index,
        ecoMode: false,
        roundSortOrder: RoundSortOrder.newestFirst.index,
      );
      
      await dao.insert(database.settingsTable, settings.toCompanion());
      
      final newSettingsData = await dao.getSettings();
      return newSettingsData!.toModel();
    }
    
    return settingsData.toModel();
  }

  Future<void> updateShowRules(bool showRules) async {
    final settings = await fetchSettings();
    settings.showRules = showRules;
    await dao.update(
      database.settingsTable,
      database.settingsTable.id,
      settings.id!,
      settings.toCompanion()
    );
  }

  Future<void> updateShowHelpDialog(bool showHelpDialog) async {
    final settings = await fetchSettings();
    settings.showHelpDialog = showHelpDialog;
    await dao.update(
      database.settingsTable,
      database.settingsTable.id,
      settings.id!,
      settings.toCompanion()
    );
  }

  Future<void> updateShowGameStats(bool showGameStats) async {
    final settings = await fetchSettings();
    settings.showGameStats = showGameStats;
    await dao.update(
      database.settingsTable,
      database.settingsTable.id,
      settings.id!,
      settings.toCompanion()
    );
  }

  Future<void> updateShowSmartCalculator(bool showSmartCalculator) async {
    final settings = await fetchSettings();
    settings.showSmartCalculator = showSmartCalculator;
    await dao.update(
      database.settingsTable,
      database.settingsTable.id,
      settings.id!,
      settings.toCompanion()
    );
  }

  Future<void> updateLockPreviousRounds(bool lockPreviousRounds) async {
    final settings = await fetchSettings();
    settings.lockPreviousRounds = lockPreviousRounds;
    await dao.update(
      database.settingsTable,
      database.settingsTable.id,
      settings.id!,
      settings.toCompanion()
    );
  }

  Future<void> updateThemeMode(AppThemeMode themeMode) async {
    final settings = await fetchSettings();
    settings.themeMode = themeMode.index;
    await dao.update(
      database.settingsTable,
      database.settingsTable.id,
      settings.id!,
      settings.toCompanion()
    );
  }

  Future<void> updateEcoMode(bool ecoMode) async {
    final settings = await fetchSettings();
    settings.ecoMode = ecoMode;
    await dao.update(
      database.settingsTable,
      database.settingsTable.id,
      settings.id!,
      settings.toCompanion()
    );
  }

  Future<void> updateRoundSortOrder(RoundSortOrder sortOrder) async {
    final settings = await fetchSettings();
    settings.roundSortOrder = sortOrder.index;
    await dao.update(
      database.settingsTable,
      database.settingsTable.id,
      settings.id!,
      settings.toCompanion()
    );
  }

  Future<void> updateSettings(UserSettings settings) async {
    final currentSettings = await fetchSettings();
    
    if (settings.showRules != null) {
      currentSettings.showRules = settings.showRules;
    }
    if (settings.showHelpDialog != null) {
      currentSettings.showHelpDialog = settings.showHelpDialog;
    }
    if (settings.showGameStats != null) {
      currentSettings.showGameStats = settings.showGameStats;
    }
    if (settings.showSmartCalculator != null) {
      currentSettings.showSmartCalculator = settings.showSmartCalculator;
    }
    if (settings.lockPreviousRounds != null) {
      currentSettings.lockPreviousRounds = settings.lockPreviousRounds;
    }
    if (settings.themeMode != null) {
      currentSettings.themeMode = settings.themeMode;
    }
    if (settings.ecoMode != null) {
      currentSettings.ecoMode = settings.ecoMode;
    }
    if (settings.roundSortOrder != null) {
      currentSettings.roundSortOrder = settings.roundSortOrder;
    }
    
    await dao.update(
      database.settingsTable,
      database.settingsTable.id,
      currentSettings.id!,
      currentSettings.toCompanion()
    );
  }
}