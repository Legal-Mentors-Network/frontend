import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFE50914),
        secondary: Color(0xFFE50914),
        surface: Color(0xFFFFFFFF),
        error: Color(0xFFB00020),
        onPrimary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFFFFFFFF),
        onSurface: Color(0xFF000000),
        onError: Color(0xFFFFFFFF),
      ),
      filledButtonTheme: filledButtonTheme(),
    );
  }

  static ThemeData dark(BuildContext ctx) {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFE50914),
        secondary: Color(0xFFE50914),
        surface: Color(0xFF1F1F1F),
        error: Color(0xFFCF6679),
        onPrimary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFFFFFFFF),
        onSurface: Color(0xFFFFFFFF),
        onError: Color(0xFFFFFFFF),
      ),
      filledButtonTheme: filledButtonTheme(),
    );
  }

  static FilledButtonThemeData filledButtonTheme() {
    return FilledButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
      ),
    );
  }
}
