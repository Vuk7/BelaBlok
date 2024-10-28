import 'package:flutter/material.dart';

class AppTheme {
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF3DB328);

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
      scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      appBarTheme: const AppBarTheme(
        color: Color(0xFFFBB117),
        elevation: 2,
        titleTextStyle: TextStyle(color: Color(0x00000000)),
      ),
      colorScheme: const ColorScheme.dark(
          surface: Color(0xFF1E1E1E),
          primary: Color(0xFFFBB117),
          secondary: Color(0xFFFFFFFF),
          tertiary: Color(0x00000000)));
}
