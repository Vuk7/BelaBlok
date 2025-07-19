import 'package:flutter/material.dart';

class AppTheme {
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF3DB328);
  static const Color gray = Color(0xFFD9D9D9);
  static const Color darkBackground = Color(0xFF2C3E50); // tamno plava pozadina

  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFFBB117),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Color(0xFFFBB117),
      elevation: 2,
      titleTextStyle: TextStyle(color: Color(0xFF000000)),
    ),
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: Color(0xFFFBB117),
      secondary: Color(0xFF000000),
      tertiary: Color(0xFFFFFFFF),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xFFFBB117),
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: const AppBarTheme(
        color: Color(0xFFFBB117),
        elevation: 2,
        titleTextStyle: TextStyle(color: Color(0x00000000)),
      ),
      colorScheme: const ColorScheme.dark(
          surface: darkBackground,
          primary: Color(0xFFFBB117),
          secondary: Color(0xFFFFFFFF),
          tertiary: Color(0x00000000)));
}
