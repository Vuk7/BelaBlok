
import 'package:flutter/material.dart';

class AppTheme {
  // Boje
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

  // Overlay boje (transparentni slojevi)
  static const Color lightOverlay = Color(0x1A000000);
  static const Color mediumOverlay = Color(0x33000000);
  static const Color heavyOverlay = Color(0x66000000);

  // Tematski Data
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: lightBackground,
    appBarTheme: const AppBarTheme(
      color: primary,
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
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
      color: primary,
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
  );

  // Stilovi teksta
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 44,
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

  static const TextStyle toggleTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle playDirectionLabelTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  // Play Direction Widget Styles
  static const double playDirectionIconContainerSize = 32.0;
  static const double playDirectionIconSize = 20.0;
  static const double playDirectionBorderRadius = 20.0;
  static const double playDirectionSpacingHorizontal = 8.0;
  static const double playDirectionSpacingVertical = 10.0;
  static const Color playDirectionIconColor = Colors.white;

  // Game Type Choice Widget Styles
  static const EdgeInsets gameTypeButtonPadding = EdgeInsets.only(right: 90, left: 90, top: 10, bottom: 10);
  static const EdgeInsets gameTypeButtonPaddingNoTop = EdgeInsets.only(right: 90, left: 90, bottom: 10);
  static const double gameTypeButtonTextPadding = 10.0;
  static const Color gameTypeButtonTextColor = Colors.black;

  static const TextStyle gameTypeNumberButtonTextStyle = TextStyle(
    color: gameTypeButtonTextColor,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle gameTypeManualButtonTextStyle = TextStyle(
    color: gameTypeButtonTextColor,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  // Game Settings Menu Widget Styles
  static const EdgeInsets gameSettingsMenuMargin = EdgeInsets.symmetric(vertical: 10);
  static const double gameSettingsMenuBorderRadius = 16.0;
  static const EdgeInsets gameSettingsMenuHeaderPadding = EdgeInsets.all(16);
  static const EdgeInsets gameSettingsMenuContentPadding = EdgeInsets.fromLTRB(16, 0, 16, 16);
  static const double gameSettingsMenuIconSize = 28.0;
  static const double gameSettingsMenuIconSpacing = 12.0;
  static const double gameSettingsMenuSectionSpacing = 16.0;
  static const double gameSettingsMenuItemSpacing = 12.0;
  static const double gameSettingsMenuBottomSpacing = 8.0;
  static const Duration gameSettingsMenuAnimationDuration = Duration(milliseconds: 300);
  static const Curve gameSettingsMenuAnimationCurve = Curves.easeInOut;
  static const double gameSettingsMenuShadowBlurRadius = 4.0;
  static const Offset gameSettingsMenuShadowOffset = Offset(0, 2);
  static const double gameSettingsMenuShadowOpacity = 0.1;

  static const TextStyle gameSettingsMenuHeaderTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle gameSettingsMenuSectionTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // Pomoćne metode za boje prema temi
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
}