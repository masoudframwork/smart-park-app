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
