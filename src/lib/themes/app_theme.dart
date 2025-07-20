import 'package:flutter/material.dart';

class AppTheme {
  
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF3DB328);
  static const Color gray = Color(0xFFD9D9D9);
  static const Color darkBackground = Color(0xFF2C3E50);
  static const Color primary = Color(0xFFFBB117); 

  // Overlay boje (transparentni slojevi)
  static const Color lightOverlay = Color(0x1A000000); // black with 10% opacity
  static const Color mediumOverlay = Color(0x33000000); // black with 20% opacity
  static const Color heavyOverlay = Color(0x66000000); // black with 40% opacity

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 2,
      titleTextStyle: TextStyle(color: Color(0xFF000000)),
    ),
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: primary,
      secondary: Color(0xFF000000), 
      tertiary: Color(0xFFFFFFFF), 
     
      outline: Color(0xFFE0E0E0), 
      outlineVariant: Color(0xFFF5F5F5), 
      surfaceContainerHighest: Color(0xFF000000), 
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: const AppBarTheme(
        color: primary,
        elevation: 2,
        titleTextStyle: TextStyle(color: Color(0xFF000000)),
      ),
      colorScheme: const ColorScheme.dark(
          surface: darkBackground,
          primary: primary,
          secondary: Color(0xFFFFFFFF), 
          tertiary: Color(0xFF000000), 
         
          outline: Color(0xFF424242), 
          outlineVariant: Color(0xFF1E1E1E), 
          surfaceContainerHighest: Color(0xFFFFFFFF), 
      ));

  
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.surfaceContainerHighest;
  }

  static Color getInverseTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.black : Colors.white;
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
    return (isDark ? Colors.white : Colors.black).withValues(alpha: opacity);
  }
}
