import 'package:flutter/material.dart';
import 'package:lmn/common/theme/colors.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: secondary,
        surface: Color(0xFFFFFFFF),
        primaryContainer: primaryContainer,
        secondaryContainer: secondaryContainer,
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
        primaryContainer: primaryContainer,
        secondaryContainer: secondaryContainer,
        onPrimary: onContainer,
        onSecondary: onContainer,
        onError: onContainer,
        onPrimaryContainer: onContainer,
        onSecondaryContainer: onContainer,
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
