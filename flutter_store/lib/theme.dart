import 'package:flutter/material.dart';

class AppTheme {
  // Define primary colors for the light and dark themes
  static const Color primaryLight = Colors.blue;
  static const Color primaryDark = Colors.teal;

  // Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryDark,
    ),
  );
}
