import 'package:flutter/material.dart';

@immutable
class GameStatsColors extends ThemeExtension<GameStatsColors> {
  final Color calls;        // Color for number of calls
  final Color fails;        // Color for number of fails
  final Color declarations; // Color for declarations (zvanja)
  final Color successCard;  // Background for success summary row
  final Color divider;      // Divider inside stats widget

  const GameStatsColors({
    required this.calls,
    required this.fails,
    required this.declarations,
    required this.successCard,
    required this.divider,
  });

  @override
  GameStatsColors copyWith({
    Color? calls,
    Color? fails,
    Color? declarations,
    Color? successCard,
    Color? divider,
  }) => GameStatsColors(
        calls: calls ?? this.calls,
        fails: fails ?? this.fails,
        declarations: declarations ?? this.declarations,
        successCard: successCard ?? this.successCard,
        divider: divider ?? this.divider,
      );

  @override
  GameStatsColors lerp(ThemeExtension<GameStatsColors>? other, double t) {
    if (other is! GameStatsColors) return this;
    return GameStatsColors(
      calls: Color.lerp(calls, other.calls, t)!,
      fails: Color.lerp(fails, other.fails, t)!,
      declarations: Color.lerp(declarations, other.declarations, t)!,
      successCard: Color.lerp(successCard, other.successCard, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }
}

class AppTheme {
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF3DB328);
  static const Color gray = Color(0xFFD9D9D9);
  static const Color darkBackground = Color(0xFF2C3E50);
  static const Color lightBackground = Color(0xFFF5E6D3);
  static const Color screenBackgroundDark = Color(0xFF1E2A38);
  static const Color primary = Color(0xFFFBB117);
  static const Color orange = Color(0xFFFF9500);
  static const Color blue = Color(0xFF2196F3);
  static const Color black = Color(0xFF000000);
  static const Color accent = Colors.amber;
  static const Color brownShadow = Colors.brown;
  static const Color lightScoreBackground = Color(0xFFE8E8E8);
  static const Color settingsButtonLightBg = Color(0xFF2D6FB6); 
  static const Color settingsButtonDarkBg = Color(0xFF1F4E7A);  

  static const Color lightOverlay = Color(0x1A000000);
  static const Color mediumOverlay = Color(0x33000000);
  static const Color heavyOverlay = Color(0x66000000);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      elevation: 2,
      titleTextStyle: TextStyle(color: black),
    ),
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: primary,
      secondary: black,
      tertiary: Colors.white,
      outline: Color(0xFFE0E0E0),
      outlineVariant: Color(0xFFF5F5F5),
      surfaceContainerHighest: black,
      error: red,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      GameStatsColors(
        calls: blue,
        fails: red,
        declarations: orange,
        successCard: Color(0xFFF2F7ED),
        divider: Color(0x22000000),
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      elevation: 2,
      titleTextStyle: TextStyle(color: black),
    ),
    colorScheme: const ColorScheme.dark(
      surface: darkBackground,
      primary: primary,
      secondary: Colors.white,
      tertiary: black,
      outline: Color(0xFF424242),
      outlineVariant: Color(0xFF1E1E1E),
      surfaceContainerHighest: Colors.white,
      error: red,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      GameStatsColors(
        calls: blue,
        fails: red,
        declarations: orange,
        successCard: Color(0xFF374239),
        divider: Color(0x33FFFFFF),
      ),
    ],
  );

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: primary,
    letterSpacing: 2,
    shadows: [
      Shadow(
        color: brownShadow,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  );

  static const TextStyle screenTitleTextStyle = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: primary,
  );

  static const TextStyle roundTitleTextStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle sectionHeaderTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle optionButtonTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle manualOptionTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle defaultButtonTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bigButtonText28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle settingsButtonTextStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: Colors.white,
  );

  static const TextStyle toggleTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static Color getScreenBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? screenBackgroundDark
        : lightBackground;
  }

  static Color getTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.surfaceContainerHighest;
  }

  static Color getInverseTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? black : Colors.white;
  }

  static Color getDisabledButtonColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey[700]! : Colors.grey[300]!;
  }

  static Color getCardBackgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey[800]! : Colors.white;
  }

  static Color getOverlayColor(BuildContext context, {double opacity = 0.1}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return (isDark ? Colors.white : black).withValues(alpha: (opacity * 255).toDouble());
  }

  static Color getScoreBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? getCardBackgroundColor(context)
        : lightScoreBackground;
  }

  static Color getSettingsButtonBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? settingsButtonDarkBg
        : settingsButtonLightBg;
  }

  static TextStyle getSettingsButtonTextStyle(BuildContext context) {
    return settingsButtonTextStyle;
  }
}