import 'package:flutter/foundation.dart';

class SettingsProvider extends ChangeNotifier {
  bool _showRules = true;

  bool get showRules => _showRules;

  void toggleShowRules(bool value) {
    if (_showRules != value) {
      _showRules = value;
      notifyListeners();
    }
  }
}
