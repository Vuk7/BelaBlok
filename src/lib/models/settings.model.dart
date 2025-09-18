import 'package:bela_blok/enums/theme_mode_enum.dart';

class SettingsModel {
  final String id;
  final bool showRules;
  final bool showHelpDialog;
  final bool showGameStats;
  final AppThemeMode themeMode;

  SettingsModel({
    required this.id,
    required this.showRules,
    required this.showHelpDialog,
    required this.showGameStats,
    required this.themeMode,
  });

  SettingsModel copyWith({
    String? id,
    bool? showRules,
    bool? showHelpDialog,
    bool? showGameStats,
    AppThemeMode? themeMode,
  }) {
    return SettingsModel(
      id: id ?? this.id,
      showRules: showRules ?? this.showRules,
      showHelpDialog: showHelpDialog ?? this.showHelpDialog,
      showGameStats: showGameStats ?? this.showGameStats,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}