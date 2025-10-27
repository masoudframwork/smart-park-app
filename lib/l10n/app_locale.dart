import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppLocale extends Model {
  static var shared = AppLocale();
  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;

  Future<void> changeLanguage({String? language, bool isSave = true}) async {
    if (language == null) {
      if (_appLocale == const Locale('en')) {
        _appLocale = const Locale('ar');
      } else {
        _appLocale = const Locale('en');
      }
    } else {
      _appLocale = Locale(language);
    }
    //if (isSave) _saveLanguage();
    // Get.updateLocale(_appLocale);
    notifyListeners();
  }

  bool isArabic() {
    var currentLang = appLocal.languageCode;
    return currentLang.contains('ar');
  }

  // Future<void> loadSavedLanguage() async {
  //   try {
  //     // No saved language: use device language
  //     final deviceLang = Get.deviceLocale?.languageCode ?? 'en';
  //     if (deviceLang == 'ar' || deviceLang == 'en') {
  //       _appLocale = Locale(deviceLang);
  //     } else {
  //       _appLocale = const Locale('en'); // fallback
  //     }

  //     // Get.updateLocale(_appLocale);
  //     notifyListeners();
  //   } catch (e) {
  //     debugPrint("Error loading saved language: $e");
  //   }
  // }

  // void _saveLanguage() {
  //   SharedPreferencesHelper.saveKey(
  //       key: CacheKeys.currentLanguage, value: isArabic() ? 'ar' : 'en');
  // }
}
