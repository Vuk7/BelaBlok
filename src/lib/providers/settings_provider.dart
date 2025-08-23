import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _showRules = true;
  bool _showHelpDialog = true;
  bool _showGameStats = true;
  bool _showMiViScore = true;

  static const _kShowRules = 'show_rules';
  static const _kShowHelp = 'show_help_dialog';
  static const _kShowStats = 'show_game_stats';
  static const _kShowMiVi = 'show_mi_vi_score';

  bool get showRules => _showRules;
  bool get showHelpDialog => _showHelpDialog;
  bool get showGameStats => _showGameStats;
  bool get showMiViScore => _showMiViScore;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _showRules = prefs.getBool(_kShowRules) ?? true;
    _showHelpDialog = prefs.getBool(_kShowHelp) ?? true;
    _showGameStats = prefs.getBool(_kShowStats) ?? true;
    _showMiViScore = prefs.getBool(_kShowMiVi) ?? true;
    notifyListeners();
  }

  void toggleShowRules(bool value) {
    if (_showRules != value) {
      _showRules = value;
  _persist(_kShowRules, value);
      notifyListeners();
    }
  }

  void toggleShowHelpDialog(bool value) {
    if (_showHelpDialog != value) {
      _showHelpDialog = value;
  _persist(_kShowHelp, value);
      notifyListeners();
    }
  }

  void toggleShowGameStats(bool value) {
    if (_showGameStats != value) {
      _showGameStats = value;
      _persist(_kShowStats, value);
      notifyListeners();
    }
  }

  void toggleShowMiViScore(bool value) {
    if (_showMiViScore != value) {
      _showMiViScore = value;
      _persist(_kShowMiVi, value);
      notifyListeners();
    }
  }

  Future<void> _persist(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}
