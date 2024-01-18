import 'package:flutter/material.dart';
import 'package:nuntium/core/services/shared_prefs_service/shared_prefs_service.dart';

class ThemingServiceSharedPrefsHandler {
  static ThemeMode getCurrentThemeMode() {
    int? index = SharedPreferencesService.instance.getValue<int>(
      key: _ThemingServiceSharedPrefsKeys.currentThemeMode,
    );
    return index == null ? ThemeMode.system : ThemeMode.values[index];
  }

  static Future<void> setCurrentThemeMode(ThemeMode mode) async {
    await SharedPreferencesService.instance.setValue<int>(
      key: _ThemingServiceSharedPrefsKeys.currentThemeMode,
      value: mode.index,
    );
  }
}

enum _ThemingServiceSharedPrefsKeys {
  currentThemeMode,
}
