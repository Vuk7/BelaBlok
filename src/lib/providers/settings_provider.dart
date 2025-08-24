import 'package:flutter/foundation.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/services/settings_service.dart';

class SettingsProvider extends ChangeNotifier {
  bool _showRules = true;
  bool _showHelpDialog = true;
  bool _showGameStats = true;
  bool _showMiViScore = true;
  String _themeMode = 'light';

  late final SettingsService _service;

  bool get showRules => _showRules;
  bool get showHelpDialog => _showHelpDialog;
  bool get showGameStats => _showGameStats;
  bool get showMiViScore => _showMiViScore;
  String get themeMode => _themeMode;

  Future<void> init(AppDatabase db) async {
    _service = SettingsService(db);
    final data = await _service.loadRaw();
    _showRules = (data['show_rules'] ?? 1) == 1;
    _showHelpDialog = (data['show_help_dialog'] ?? 1) == 1;
    _showGameStats = (data['show_game_stats'] ?? 1) == 1;
    _showMiViScore = (data['show_mi_vi_score'] ?? 1) == 1;
    _themeMode = (data['theme_mode'] ?? 'light') as String;
    notifyListeners();
  }

  void toggleShowRules(bool value) {
    if (_showRules != value) {
      _showRules = value;
      _persist(showRules: value);
      notifyListeners();
    }
  }

  void toggleShowHelpDialog(bool value) {
    if (_showHelpDialog != value) {
      _showHelpDialog = value;
      _persist(showHelpDialog: value);
      notifyListeners();
    }
  }

  void toggleShowGameStats(bool value) {
    if (_showGameStats != value) {
      _showGameStats = value;
      _persist(showGameStats: value);
      notifyListeners();
    }
  }
  Future<void> setThemeMode(String mode) async {
    if (_themeMode != mode) {
      _themeMode = mode;
      await _persist(themeMode: mode);
      notifyListeners();
    }
  }

  Future<void> _persist({
    bool? showRules,
    bool? showHelpDialog,
    bool? showGameStats,
    bool? showMiViScore,
    String? themeMode,
  }) async {
    await _service.update(
      showRules: showRules,
      showHelpDialog: showHelpDialog,
      showGameStats: showGameStats,
      showMiViScore: showMiViScore,
      themeMode: themeMode,
    );
  }
}
