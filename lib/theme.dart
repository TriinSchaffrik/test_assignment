import 'package:flutter/material.dart';

Color textColor = const Color(0xFF35323d);
Color seedColor = const Color(0xFF7F9DBE);
Color backGroundColor = const Color(0xFFFAF8F5);
Color buttonColor = const Color(0xFF88A096);
Color errorColor = const Color(0xFFa4031f);

class AppTheme {
  const AppTheme._();

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      surface: backGroundColor,
      contrastLevel: 0.8,
      error: errorColor,
    ),
    indicatorColor: buttonColor,
    textTheme: TextTheme(
      displayMedium: const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: const TextStyle(
        fontSize: 35,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: const TextStyle(
        fontSize: 15,
      ),
      bodySmall: TextStyle(
        color: textColor.withOpacity(0.5),
        fontSize: 15,
      ),
      displaySmall: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
  );
}
