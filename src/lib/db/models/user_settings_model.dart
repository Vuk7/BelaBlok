import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/base_model.dart';
import 'package:bela_blok/enums/theme_mode_enum.dart';
import 'package:drift/drift.dart';

class UserSettings extends BaseModel {
  bool? showRules;
  bool? showHelpDialog;
  bool? showGameStats;
  bool? showSmartCalculator;
  int? themeMode;

  UserSettings({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    this.showRules,
    this.showHelpDialog,
    this.showGameStats,
    this.showSmartCalculator,
    this.themeMode,
  });

  AppThemeMode get themeModeEnum => AppThemeMode.values[themeMode ?? 0];
}

extension UserSettingsMapper on SettingsTableData {
  UserSettings toModel() {
    return UserSettings(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      showRules: showRules,
      showHelpDialog: showHelpDialog,
      showGameStats: showGameStats,
      showSmartCalculator: showSmartCalculator,
      themeMode: themeMode,
    );
  }
}

extension UserSettingsModelMapper on UserSettings {
  SettingsTableCompanion toCompanion() {
    return SettingsTableCompanion(
      updatedAt: Value(updatedAt ?? DateTime.now()),
      deletedAt: Value(deletedAt),
      showRules: showRules != null ? Value(showRules!) : const Value.absent(),
      showHelpDialog: showHelpDialog != null ? Value(showHelpDialog!) : const Value.absent(),
      showGameStats: showGameStats != null ? Value(showGameStats!) : const Value.absent(),
      showSmartCalculator: showSmartCalculator != null ? Value(showSmartCalculator!) : const Value.absent(),
      themeMode: themeMode != null ? Value(themeMode!) : const Value.absent(),
    );
  }
}
