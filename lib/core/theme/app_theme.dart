// lib/core/themes/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // 공통 색상 정의
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.orange;
  static const Color backgroundColor = Colors.white;

  // 라이트 테마
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      background: backgroundColor,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  // 다크 테마
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
      background: Colors.black,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
