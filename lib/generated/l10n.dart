// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `⏱️ Connection timed out.`
  String get dio_timeout {
    return Intl.message(
      '⏱️ Connection timed out.',
      name: 'dio_timeout',
      desc: '',
      args: [],
    );
  }

  /// `🔒 SSL certificate error.`
  String get dio_ssl_error {
    return Intl.message(
      '🔒 SSL certificate error.',
      name: 'dio_ssl_error',
      desc: '',
      args: [],
    );
  }

  /// `❌ Request was cancelled.`
  String get dio_request_cancelled {
    return Intl.message(
      '❌ Request was cancelled.',
      name: 'dio_request_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `🔐 Unauthorized. Please log in again.`
  String get dio_unauthorized {
    return Intl.message(
      '🔐 Unauthorized. Please log in again.',
      name: 'dio_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `🔎 Not found.`
  String get dio_not_found {
    return Intl.message(
      '🔎 Not found.',
      name: 'dio_not_found',
      desc: '',
      args: [],
    );
  }

  /// `🔥 Server error. Try again later.`
  String get dio_server_error {
    return Intl.message(
      '🔥 Server error. Try again later.',
      name: 'dio_server_error',
      desc: '',
      args: [],
    );
  }

  /// `⚠️ Error: An error occured while fetching data`
  String get dio_generic_error {
    return Intl.message(
      '⚠️ Error: An error occured while fetching data',
      name: 'dio_generic_error',
      desc: '',
      args: [],
    );
  }

  /// `📴 No internet connection.`
  String get dio_no_connection {
    return Intl.message(
      '📴 No internet connection.',
      name: 'dio_no_connection',
      desc: '',
      args: [],
    );
  }

  /// `❗ Unexpected error occurred.`
  String get dio_unexpected_error {
    return Intl.message(
      '❗ Unexpected error occurred.',
      name: 'dio_unexpected_error',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Something went wrong. Please try again later.`
  String get unknonError {
    return Intl.message(
      'Oops! Something went wrong. Please try again later.',
      name: 'unknonError',
      desc: '',
      args: [],
    );
  }

  /// `SAMPLE LOGO`
  String get sampleLogo {
    return Intl.message('SAMPLE LOGO', name: 'sampleLogo', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Wallet`
  String get wallet {
    return Intl.message('Wallet', name: 'wallet', desc: '', args: []);
  }

  /// `Bookings`
  String get bookings {
    return Intl.message('Bookings', name: 'bookings', desc: '', args: []);
  }

  /// `Do not display instructions again`
  String get doNotDisplayInstructionsAgain {
    return Intl.message(
      'Do not display instructions again',
      name: 'doNotDisplayInstructionsAgain',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get profile_fullName {
    return Intl.message(
      'Full Name',
      name: 'profile_fullName',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get profile_nationalId {
    return Intl.message(
      'National ID',
      name: 'profile_nationalId',
      desc: '',
      args: [],
    );
  }

  /// `Date Of Birth`
  String get profile_date_of_birth {
    return Intl.message(
      'Date Of Birth',
      name: 'profile_date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Connect With Nafath`
  String get profile_connect_with_nafath {
    return Intl.message(
      'Connect With Nafath',
      name: 'profile_connect_with_nafath',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get profile_phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'profile_phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Additional Information`
  String get profile_additionalInfo {
    return Intl.message(
      'Additional Information',
      name: 'profile_additionalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Tickets`
  String get profile_fines {
    return Intl.message('Tickets', name: 'profile_fines', desc: '', args: []);
  }

  /// `Wallet`
  String get profile_wallet {
    return Intl.message('Wallet', name: 'profile_wallet', desc: '', args: []);
  }

  /// `Saved Information`
  String get profile_savedInfo {
    return Intl.message(
      'Saved Information',
      name: 'profile_savedInfo',
      desc: '',
      args: [],
    );
  }

  /// `Vehicles`
  String get profile_vehicles {
    return Intl.message(
      'Vehicles',
      name: 'profile_vehicles',
      desc: '',
      args: [],
    );
  }

  /// `E-Payment Cards`
  String get profile_paymentCards {
    return Intl.message(
      'E-Payment Cards',
      name: 'profile_paymentCards',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get profile_settings {
    return Intl.message(
      'Settings',
      name: 'profile_settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get profile_logout {
    return Intl.message('Logout', name: 'profile_logout', desc: '', args: []);
  }

  /// `Settings`
  String get settings_title {
    return Intl.message('Settings', name: 'settings_title', desc: '', args: []);
  }

  /// `Terms & Conditions`
  String get settings_terms {
    return Intl.message(
      'Terms & Conditions',
      name: 'settings_terms',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get settings_privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'settings_privacy',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get settings_faq {
    return Intl.message('FAQ', name: 'settings_faq', desc: '', args: []);
  }

  /// `Help & Support`
  String get settings_support {
    return Intl.message(
      'Help & Support',
      name: 'settings_support',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get settings_dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'settings_dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settings_language {
    return Intl.message(
      'Language',
      name: 'settings_language',
      desc: '',
      args: [],
    );
  }

  /// `AR`
  String get settings_lang_ar {
    return Intl.message('AR', name: 'settings_lang_ar', desc: '', args: []);
  }

  /// `EN`
  String get settings_lang_en {
    return Intl.message('EN', name: 'settings_lang_en', desc: '', args: []);
  }

  /// `Search for parking`
  String get searchParkingHint {
    return Intl.message(
      'Search for parking',
      name: 'searchParkingHint',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchTooltip {
    return Intl.message('Search', name: 'searchTooltip', desc: '', args: []);
  }

  /// `Please scan the parking code`
  String get scanParkingCode {
    return Intl.message(
      'Please scan the parking code',
      name: 'scanParkingCode',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_title {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_title',
      desc: '',
      args: [],
    );
  }

  /// `The information we collect`
  String get terms_section_1 {
    return Intl.message(
      'The information we collect',
      name: 'terms_section_1',
      desc: '',
      args: [],
    );
  }

  /// `How to use the information`
  String get terms_section_2 {
    return Intl.message(
      'How to use the information',
      name: 'terms_section_2',
      desc: '',
      args: [],
    );
  }

  /// `Sharing information`
  String get terms_section_3 {
    return Intl.message(
      'Sharing information',
      name: 'terms_section_3',
      desc: '',
      args: [],
    );
  }

  /// `Data protection`
  String get terms_section_4 {
    return Intl.message(
      'Data protection',
      name: 'terms_section_4',
      desc: '',
      args: [],
    );
  }

  /// `User rights`
  String get terms_section_5 {
    return Intl.message(
      'User rights',
      name: 'terms_section_5',
      desc: '',
      args: [],
    );
  }

  /// `Cookies`
  String get terms_section_6 {
    return Intl.message('Cookies', name: 'terms_section_6', desc: '', args: []);
  }

  /// `Privacy Policy Update`
  String get terms_section_7 {
    return Intl.message(
      'Privacy Policy Update',
      name: 'terms_section_7',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get terms_section_8 {
    return Intl.message(
      'Contact us',
      name: 'terms_section_8',
      desc: '',
      args: [],
    );
  }

  /// `We use your data for the following purposes:`
  String get terms_usage_0 {
    return Intl.message(
      'We use your data for the following purposes:',
      name: 'terms_usage_0',
      desc: '',
      args: [],
    );
  }

  /// `Managing parking booking and payment processes`
  String get terms_usage_1 {
    return Intl.message(
      'Managing parking booking and payment processes',
      name: 'terms_usage_1',
      desc: '',
      args: [],
    );
  }

  /// `Improving user experience and service development`
  String get terms_usage_2 {
    return Intl.message(
      'Improving user experience and service development',
      name: 'terms_usage_2',
      desc: '',
      args: [],
    );
  }

  /// `Communicating with you regarding inquiries or important notifications`
  String get terms_usage_3 {
    return Intl.message(
      'Communicating with you regarding inquiries or important notifications',
      name: 'terms_usage_3',
      desc: '',
      args: [],
    );
  }

  /// `For analytical and statistical purposes to improve app performance`
  String get terms_usage_4 {
    return Intl.message(
      'For analytical and statistical purposes to improve app performance',
      name: 'terms_usage_4',
      desc: '',
      args: [],
    );
  }

  /// `Ensuring compliance with local laws and regulations`
  String get terms_usage_5 {
    return Intl.message(
      'Ensuring compliance with local laws and regulations',
      name: 'terms_usage_5',
      desc: '',
      args: [],
    );
  }

  /// `Help and technical support`
  String get help_support_title {
    return Intl.message(
      'Help and technical support',
      name: 'help_support_title',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get help_contact_us {
    return Intl.message(
      'Contact us',
      name: 'help_contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Message us`
  String get help_message_us {
    return Intl.message(
      'Message us',
      name: 'help_message_us',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
