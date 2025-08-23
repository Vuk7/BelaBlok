import 'package:flutter/foundation.dart';

class SettingsProvider extends ChangeNotifier {
  bool _showRules = true;
  bool _showHelpDialog = true;
  bool _showGameStats = true;

  bool get showRules => _showRules;
  bool get showHelpDialog => _showHelpDialog;
  bool get showGameStats => _showGameStats;

  void toggleShowRules(bool value) {
    if (_showRules != value) {
      _showRules = value;
      notifyListeners();
    }
  }

  void toggleShowHelpDialog(bool value) {
    if (_showHelpDialog != value) {
      _showHelpDialog = value;
      notifyListeners();
    }
  }

  void toggleShowGameStats(bool value) {
    if (_showGameStats != value) {
      _showGameStats = value;
      notifyListeners();
    }
  }
}
