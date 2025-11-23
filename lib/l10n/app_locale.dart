import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../core/helpers/secure_stoage_helper.dart';

class AppLocale extends Model {
  static final AppLocale shared = AppLocale._internal();

  AppLocale._internal() {
    _loadSavedLanguage();
  }

  final SecureStorageHelper _storage = SecureStorageHelper();
  static const String kLanguageCodeKey = 'language_code';

  Locale _appLocale = const Locale('en');
  Locale get appLocal => _appLocale;

  Future<void> changeLanguage({String? language, bool isSave = true}) async {
    if (language == null) {
      if (_appLocale.languageCode == 'en') {
        _appLocale = const Locale('ar');
      } else {
        _appLocale = const Locale('en');
      }
    } else {
      _appLocale = Locale(language);
    }

    if (isSave) {
      await _saveLanguage();
    }

    notifyListeners();
  }

  bool isArabic() {
    return _appLocale.languageCode == 'ar';
  }

  Future<void> _loadSavedLanguage() async {
    try {
      final savedCode = await _storage.read(kLanguageCodeKey);

      if (savedCode != null && (savedCode == 'ar' || savedCode == 'en')) {
        _appLocale = Locale(savedCode);
      } else {
        _appLocale = const Locale('en');
      }

      notifyListeners();
    } catch (e) {
      debugPrint("Error loading saved language: $e");
      _appLocale = const Locale('en');
      notifyListeners();
    }
  }

  Future<void> _saveLanguage() async {
    await _storage.write(
      kLanguageCodeKey,
      isArabic() ? 'ar' : 'en',
    );
  }
}
