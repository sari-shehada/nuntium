import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theming_service_shared_prefs_handler.dart';

class ThemingService {
  ThemingService({
    // required this.isDarkMode,
    required this.currentThemeMode,
  });

  bool get isDarkMode => Get.isDarkMode;
  // bool  isDarkMode;
  ThemeMode currentThemeMode;
  static late ThemingService instance;

  static ThemingService init() {
    ThemeMode currentThemeMode = _getCurrentThemeModeFromSharedPrefs();
    instance = ThemingService(
      // isDarkMode: Get.isDarkMode,
      currentThemeMode: currentThemeMode,
    );
    return instance;
  }

  void toggleLightAndDarkTheme() {
    // isDarkMode = !isDarkMode;
    _updateThemeMode();
    _applyCurrentThemeMode();
  }

  void setCurrentThemeMode(ThemeMode themeMode) {
    _updateThemeMode(themeMode: themeMode);
    _applyCurrentThemeMode();
  }

  static ThemeMode _getCurrentThemeModeFromSharedPrefs() {
    return ThemingServiceSharedPrefsHandler.getCurrentThemeMode();
  }

  Future<void> _updateThemeMode({ThemeMode? themeMode}) async {
    if (themeMode == null) {
      currentThemeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    } else {
      currentThemeMode = themeMode;
    }
    await ThemingServiceSharedPrefsHandler.setCurrentThemeMode(
        currentThemeMode);
  }

  void _applyCurrentThemeMode() {
    Get.changeThemeMode(currentThemeMode);
  }
}
