import 'package:bela_blok/common/constants.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:bela_blok/services/settings_services.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/enums/theme_mode_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:bela_blok/routes/routes.dart';

/// Notifier for Eco Mode — disables animations app-wide when enabled.
class EcoModeNotifier extends ChangeNotifier {
  bool _isEcoMode = false;
  late SettingsService _settingsService;

  bool get isEcoMode => _isEcoMode;

  EcoModeNotifier() {
    _settingsService = SettingsService(AppDatabase());
    _loadFromDatabase();
  }

  Future<void> _loadFromDatabase() async {
    try {
      final settings = await _settingsService.fetchSettings();
      _isEcoMode = settings.ecoMode ?? false;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  Future<void> setEcoMode(bool value) async {
    if (_isEcoMode != value) {
      _isEcoMode = value;
      notifyListeners();
      await _settingsService.updateEcoMode(value);
    }
  }
}

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  late SettingsService _settingsService;

  ThemeMode get themeMode => _themeMode;

  ThemeNotifier() {
    _settingsService = SettingsService(AppDatabase());
    _loadThemeFromDatabase();
  }

  Future<void> _loadThemeFromDatabase() async {
    try {
      final settings = await _settingsService.fetchSettings();
      final themeModeEnum = AppThemeMode.values[settings.themeMode ?? 0];
      
      switch (themeModeEnum) {
        case AppThemeMode.light:
          _themeMode = ThemeMode.light;
          break;
        case AppThemeMode.dark:
          _themeMode = ThemeMode.dark;
          break;
        case AppThemeMode.system:
          _themeMode = ThemeMode.system;
          break;
      }
      
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  void toggleTheme() {
    final newMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    setThemeMode(newMode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
      
      // Save to database
      AppThemeMode themeModeEnum;
      switch (mode) {
        case ThemeMode.light:
          themeModeEnum = AppThemeMode.light;
          break;
        case ThemeMode.dark:
          themeModeEnum = AppThemeMode.dark;
          break;
        case ThemeMode.system:
          themeModeEnum = AppThemeMode.system;
          break;
      }
      
      await _settingsService.updateThemeMode(themeModeEnum);
    }
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Lock orientation to portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => EcoModeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp.router(
          title: appName,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeNotifier.themeMode,
        );
      },
    );
  }
}
