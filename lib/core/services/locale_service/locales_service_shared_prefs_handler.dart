import 'package:flutter/widgets.dart';
import 'package:nuntium/core/services/shared_perfs_service/shared_prefs_service.dart';

class LocalesServiceSharedPrefs {
  static Future<void> setLocale(String languageCode) async {
    await SharedPreferencesService.instance.setValue(
        key: _LocalesServiceSharedPrefsKeys.currentLocale, value: languageCode);
  }

  static Locale getLocale(String fallbackLocale) {
    String? res = SharedPreferencesService.instance
        .getValue<String>(key: _LocalesServiceSharedPrefsKeys.currentLocale);

    return Locale(res ?? fallbackLocale);
  }
}

enum _LocalesServiceSharedPrefsKeys {
  currentLocale,
}
