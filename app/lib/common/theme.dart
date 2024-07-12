import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF2962FF),
        secondary: Color(0xFF03DAC6),
        primaryContainer: Color(0xFF000000),
        secondaryContainer: Color(0xFF0039CB),
        onPrimaryContainer: Color(0xFFFFFFFF),
        onSecondaryContainer: Color(0xFFFFFFFF),
      ),
      filledButtonTheme: filledButtonTheme(),
    );
  }

  static ThemeData dark(BuildContext ctx) {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF2962FF),
        secondary: Color(0xFF000000),
        surface: Color(0xFF1F1F1F),
        onPrimary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFFFFFFFF),
        onError: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFF000000),
        secondaryContainer: Color(0xFF0039CB),
        onPrimaryContainer: Color(0xFF000000),
        onSecondaryContainer: Color(0xFFFFFFFF),
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
