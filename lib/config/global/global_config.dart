import 'package:flutter/material.dart';
import 'package:nuntium/core/services/locale_service/locales_service.dart';
import 'package:nuntium/core/services/shared_perfs_service/shared_prefs_service.dart';
import 'package:nuntium/core/services/theming_service/theming_service.dart';

class GlobalConfig {
  static bool _alreadyInitialized = false;

  static Future<void> performInitialConfiguration() async {
    if (_alreadyInitialized) return;
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferencesService.init();
    ThemingService.init();
    LocalesService.init(fallbackLanguageCode: 'en');

    //TODO: Revisit
    // NetworkServiceConfig.init(NetworkServiceBaseURLEnvironment.local);

    // await initializeDateFormatting('ar', '/');
    // await initializeDateFormatting('en', '/');
    //FIXME: Comment HTTP Overrides if not needed
    // HttpOverrides.global = HttpCertificateOverrides();
    _alreadyInitialized = true;
  }
}
