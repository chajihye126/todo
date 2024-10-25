import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff546fff);
  static const Color accentColor = Color(0xffd974bc);

  static const Color whiteColor = Color(0xfffbfefd);
  static const Color blackColor = Color(0xff121312);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: primaryColor
    ),
    scaffoldBackgroundColor: Color(0xfffcfcfc),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xfffcfcfc)),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
