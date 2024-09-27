import 'package:flutter/material.dart';
import 'package:lmn/common/theme/constants.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: secondary,
        surface: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFF171717),
        secondaryContainer: secondaryContainer,
        tertiaryContainer: Color(0xFF161B2C),
        onPrimary: onContainer,
        onSecondary: onContainer,
        onError: onContainer,
        onPrimaryContainer: onContainer,
        onSecondaryContainer: onContainer,
      ),
      filledButtonTheme: filledButtonTheme(),
    );
  }

  static ThemeData dark(BuildContext ctx) {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: Color(0xFF1F1F1F),
        primaryContainer: Color(0xFF0D0D0D),
        secondaryContainer: secondaryContainer,
        tertiaryContainer: Color(0xFF414659),
        onPrimary: onContainer,
        onSecondary: onContainer,
        onError: onContainer,
        onPrimaryContainer: onContainer,
        onSecondaryContainer: onContainer,
        onTertiaryContainer: Color(0xFFDDE1F9),
      ),
      filledButtonTheme: filledButtonTheme(),
    );
  }

  static FilledButtonThemeData filledButtonTheme() {
    return FilledButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
      ),
    );
  }
}
