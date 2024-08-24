import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/controllers/application_controller.dart';

class ThemeNotifier extends Notifier<ThemeMode> {
  static String field = 'theme_mode';

  @override
  ThemeMode build() {
    return ThemeMode.light;
  }

  void initialiseWith(ThemeMode themeMode) => state = themeMode;

  Future<void> setTheme(ThemeMode themeMode) async {
    await ApplicationController(ref).setConfigItem(field, themeMode.name);
    state = themeMode;
  }
}

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(ThemeNotifier.new);
