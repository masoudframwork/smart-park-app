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

  /// `Previously Saved Info`
  String get profile_savedInfo {
    return Intl.message(
      'Previously Saved Info',
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

  /// `Soon`
  String get profile_soon {
    return Intl.message('Soon', name: 'profile_soon', desc: '', args: []);
  }

  /// `bdulrahman Ahmed Abdullah`
  String get profile_test_name {
    return Intl.message(
      'bdulrahman Ahmed Abdullah',
      name: 'profile_test_name',
      desc: '',
      args: [],
    );
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

  /// `Park your vehicle with ease!`
  String get parkyourvehiclewithease {
    return Intl.message(
      'Park your vehicle with ease!',
      name: 'parkyourvehiclewithease',
      desc: '',
      args: [],
    );
  }

  /// `Explore the map and find the nearest parking spot anytime, anywhere`
  String get explore_the_map_and_find_the_nearest {
    return Intl.message(
      'Explore the map and find the nearest parking spot anytime, anywhere',
      name: 'explore_the_map_and_find_the_nearest',
      desc: '',
      args: [],
    );
  }

  /// `No more searching or hassle`
  String get no_more_searching_or_hassle {
    return Intl.message(
      'No more searching or hassle',
      name: 'no_more_searching_or_hassle',
      desc: '',
      args: [],
    );
  }

  /// `Reserve your parking spot in the shortest time and set off with confidence`
  String get reserve_your_parking_spot {
    return Intl.message(
      'Reserve your parking spot in the shortest time and set off with confidence',
      name: 'reserve_your_parking_spot',
      desc: '',
      args: [],
    );
  }

  /// `Change in plans? No problem`
  String get change_in_plans_no_problem {
    return Intl.message(
      'Change in plans? No problem',
      name: 'change_in_plans_no_problem',
      desc: '',
      args: [],
    );
  }

  /// `Extend your booking easily and enjoy your time without worry or fines`
  String get extend_your_booking_easily_and_enjoy {
    return Intl.message(
      'Extend your booking easily and enjoy your time without worry or fines',
      name: 'extend_your_booking_easily_and_enjoy',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Enter your phone number to receive an OTP`
  String get enteryourphonenumbertoreceivanotp {
    return Intl.message(
      'Enter your phone number to receive an OTP',
      name: 'enteryourphonenumbertoreceivanotp',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get send_code {
    return Intl.message('Send Code', name: 'send_code', desc: '', args: []);
  }

  /// `Sending...`
  String get sending {
    return Intl.message('Sending...', name: 'sending', desc: '', args: []);
  }

  /// `You don't have an account?`
  String get you_dont_have_an_account {
    return Intl.message(
      'You don\'t have an account?',
      name: 'you_dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `You can `
  String get you_can {
    return Intl.message('You can ', name: 'you_can', desc: '', args: []);
  }

  /// `Create a new account `
  String get create_anew_account {
    return Intl.message(
      'Create a new account ',
      name: 'create_anew_account',
      desc: '',
      args: [],
    );
  }

  /// `easily `
  String get easily {
    return Intl.message('easily ', name: 'easily', desc: '', args: []);
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `Use as a guest`
  String get use_as_aguest {
    return Intl.message(
      'Use as a guest',
      name: 'use_as_aguest',
      desc: '',
      args: [],
    );
  }

  /// `An OTP has been sent to the number ending in 000`
  String get an_otp_has_been_sent_to_the_number_ending {
    return Intl.message(
      'An OTP has been sent to the number ending in 000',
      name: 'an_otp_has_been_sent_to_the_number_ending',
      desc: '',
      args: [],
    );
  }

  /// `A new code will be sent in`
  String get anew_code_will_be_sent_in {
    return Intl.message(
      'A new code will be sent in',
      name: 'anew_code_will_be_sent_in',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account ?`
  String get already_have_an_account {
    return Intl.message(
      'Already have an account ?',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Full name `
  String get full_name {
    return Intl.message('Full name ', name: 'full_name', desc: '', args: []);
  }

  /// `Create account`
  String get create_account {
    return Intl.message(
      'Create account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the terms and conditions`
  String get Iagreetothetermsandconditions {
    return Intl.message(
      'I agree to the terms and conditions',
      name: 'Iagreetothetermsandconditions',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur`
  String get parkingbookingandpaymentmanagementsystemimprovement {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur',
      name: 'parkingbookingandpaymentmanagementsystemimprovement',
      desc: '',
      args: [],
    );
  }

  /// `Verify Account`
  String get verifyAccount {
    return Intl.message(
      'Verify Account',
      name: 'verifyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Varify Account`
  String get varifyAccount {
    return Intl.message(
      'Varify Account',
      name: 'varifyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been created successfully!`
  String get youraccounthasbeencreatedsuccessfully {
    return Intl.message(
      'Your account has been created successfully!',
      name: 'youraccounthasbeencreatedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continu_e {
    return Intl.message('Continue', name: 'continu_e', desc: '', args: []);
  }

  /// `Welcome to our parking app`
  String get welcometoourparkingapp {
    return Intl.message(
      'Welcome to our parking app',
      name: 'welcometoourparkingapp',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Nafath`
  String get connectwithNafath {
    return Intl.message(
      'Connect with Nafath',
      name: 'connectwithNafath',
      desc: '',
      args: [],
    );
  }

  /// `ID number`
  String get idNumber {
    return Intl.message('ID number', name: 'idNumber', desc: '', args: []);
  }

  /// `Do this later`
  String get do_this_later {
    return Intl.message(
      'Do this later',
      name: 'do_this_later',
      desc: '',
      args: [],
    );
  }

  /// `Verify through Nafath app`
  String get verifythroughNafathapp {
    return Intl.message(
      'Verify through Nafath app',
      name: 'verifythroughNafathapp',
      desc: '',
      args: [],
    );
  }

  /// `Please login to Nafath app and select the following number`
  String get pleaselogintoNafathappandselectthefollowingnumber {
    return Intl.message(
      'Please login to Nafath app and select the following number',
      name: 'pleaselogintoNafathappandselectthefollowingnumber',
      desc: '',
      args: [],
    );
  }

  /// `Open Nafath App`
  String get openNafathApp {
    return Intl.message(
      'Open Nafath App',
      name: 'openNafathApp',
      desc: '',
      args: [],
    );
  }

  /// `Your account is now connected with Nafath`
  String get youraccountisnowconnectedwithNafath {
    return Intl.message(
      'Your account is now connected with Nafath',
      name: 'youraccountisnowconnectedwithNafath',
      desc: '',
      args: [],
    );
  }

  /// `Enter your card info`
  String get enteryourcardinfo {
    return Intl.message(
      'Enter your card info',
      name: 'enteryourcardinfo',
      desc: '',
      args: [],
    );
  }

  /// `Card type`
  String get cardtype {
    return Intl.message('Card type', name: 'cardtype', desc: '', args: []);
  }

  /// `Card number`
  String get cardnumber {
    return Intl.message('Card number', name: 'cardnumber', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Expiry date`
  String get expirydate {
    return Intl.message('Expiry date', name: 'expirydate', desc: '', args: []);
  }

  /// `Save Card`
  String get saveCard {
    return Intl.message('Save Card', name: 'saveCard', desc: '', args: []);
  }

  /// `Save Vehicle`
  String get saveVehicle {
    return Intl.message(
      'Save Vehicle',
      name: 'saveVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your vehicle info`
  String get enteryourvehicleinfo {
    return Intl.message(
      'Enter your vehicle info',
      name: 'enteryourvehicleinfo',
      desc: '',
      args: [],
    );
  }

  /// `Saudi vehicle`
  String get saudivehicle {
    return Intl.message(
      'Saudi vehicle',
      name: 'saudivehicle',
      desc: '',
      args: [],
    );
  }

  /// `Non-Saudi vehicle`
  String get nonsaudivehicle {
    return Intl.message(
      'Non-Saudi vehicle',
      name: 'nonsaudivehicle',
      desc: '',
      args: [],
    );
  }

  /// `Plate type`
  String get platetype {
    return Intl.message('Plate type', name: 'platetype', desc: '', args: []);
  }

  /// `Plate number`
  String get platenumber {
    return Intl.message(
      'Plate number',
      name: 'platenumber',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle color`
  String get vehiclecolor {
    return Intl.message(
      'Vehicle color',
      name: 'vehiclecolor',
      desc: '',
      args: [],
    );
  }

  /// `Avatar`
  String get avatar {
    return Intl.message('Avatar', name: 'avatar', desc: '', args: []);
  }

  /// `Available now`
  String get availablenow {
    return Intl.message(
      'Available now',
      name: 'availablenow',
      desc: '',
      args: [],
    );
  }

  /// `Not available`
  String get notavailable {
    return Intl.message(
      'Not available',
      name: 'notavailable',
      desc: '',
      args: [],
    );
  }

  /// `Zone 013`
  String get zone013 {
    return Intl.message('Zone 013', name: 'zone013', desc: '', args: []);
  }

  /// `Available parking 70/13`
  String get availableparking {
    return Intl.message(
      'Available parking 70/13',
      name: 'availableparking',
      desc: '',
      args: [],
    );
  }

  /// `Khurais Road, Riyadh, Saudi Arabia`
  String get khuraisRoadRiyadhSaudiArabia {
    return Intl.message(
      'Khurais Road, Riyadh, Saudi Arabia',
      name: 'khuraisRoadRiyadhSaudiArabia',
      desc: '',
      args: [],
    );
  }

  /// `About this park`
  String get aboutthispark {
    return Intl.message(
      'About this park',
      name: 'aboutthispark',
      desc: '',
      args: [],
    );
  }

  /// `It is a long-established fact that the readable content of a page will distract the reader from focusing on the external appearance of the text or the layout of the paragraphs on the page. Therefore, the Lorem Ipsum method is used because it provides a natural distribution.`
  String get Itisalongestablishedfactthatthereadablecontentofapage {
    return Intl.message(
      'It is a long-established fact that the readable content of a page will distract the reader from focusing on the external appearance of the text or the layout of the paragraphs on the page. Therefore, the Lorem Ipsum method is used because it provides a natural distribution.',
      name: 'Itisalongestablishedfactthatthereadablecontentofapage',
      desc: '',
      args: [],
    );
  }

  /// `Book Here`
  String get bookHere {
    return Intl.message('Book Here', name: 'bookHere', desc: '', args: []);
  }

  /// `Price throughout the day`
  String get pricethroughouttheday {
    return Intl.message(
      'Price throughout the day',
      name: 'pricethroughouttheday',
      desc: '',
      args: [],
    );
  }

  /// `Additional services`
  String get additionalservices {
    return Intl.message(
      'Additional services',
      name: 'additionalservices',
      desc: '',
      args: [],
    );
  }

  /// `laundry service`
  String get laundryservice {
    return Intl.message(
      'laundry service',
      name: 'laundryservice',
      desc: '',
      args: [],
    );
  }

  /// `EV charging`
  String get evcharging {
    return Intl.message('EV charging', name: 'evcharging', desc: '', args: []);
  }

  /// `Parachute`
  String get parachute {
    return Intl.message('Parachute', name: 'parachute', desc: '', args: []);
  }

  /// `Free Wi-Fi`
  String get freeWifi {
    return Intl.message('Free Wi-Fi', name: 'freeWifi', desc: '', args: []);
  }

  /// `Free`
  String get free {
    return Intl.message('Free', name: 'free', desc: '', args: []);
  }

  /// `Close   `
  String get close {
    return Intl.message('Close   ', name: 'close', desc: '', args: []);
  }

  /// `Choose the vehicle`
  String get choosethevehicle {
    return Intl.message(
      'Choose the vehicle',
      name: 'choosethevehicle',
      desc: '',
      args: [],
    );
  }

  /// `Specify the duration of the stop`
  String get specifythedurationofthestop {
    return Intl.message(
      'Specify the duration of the stop',
      name: 'specifythedurationofthestop',
      desc: '',
      args: [],
    );
  }

  /// `Continue to pay`
  String get continuetopay {
    return Intl.message(
      'Continue to pay',
      name: 'continuetopay',
      desc: '',
      args: [],
    );
  }

  /// `Nissan Pathfinder 2023 / Black`
  String get nissanPathfinderBlack {
    return Intl.message(
      'Nissan Pathfinder 2023 / Black',
      name: 'nissanPathfinderBlack',
      desc: '',
      args: [],
    );
  }

  /// `Toyota Corolla 2024 / Red`
  String get toyotaCorollaRed {
    return Intl.message(
      'Toyota Corolla 2024 / Red',
      name: 'toyotaCorollaRed',
      desc: '',
      args: [],
    );
  }

  /// `New vehicle`
  String get newvehicle {
    return Intl.message('New vehicle', name: 'newvehicle', desc: '', args: []);
  }

  /// `Set the duration`
  String get settheduration {
    return Intl.message(
      'Set the duration',
      name: 'settheduration',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Booking Summary`
  String get bookingSummary {
    return Intl.message(
      'Booking Summary',
      name: 'bookingSummary',
      desc: '',
      args: [],
    );
  }

  /// `/hour`
  String get hour {
    return Intl.message('/hour', name: 'hour', desc: '', args: []);
  }

  /// `Zone 013-Khurais Road, Riyadh, Kingdom of Saudi Arabia`
  String get zone013KhuraisRoadRiyadhKingdomofSaudiArabia {
    return Intl.message(
      'Zone 013-Khurais Road, Riyadh, Kingdom of Saudi Arabia',
      name: 'zone013KhuraisRoadRiyadhKingdomofSaudiArabia',
      desc: '',
      args: [],
    );
  }

  /// `30 minute`
  String get minute30 {
    return Intl.message('30 minute', name: 'minute30', desc: '', args: []);
  }

  /// `2 hour`
  String get hour2 {
    return Intl.message('2 hour', name: 'hour2', desc: '', args: []);
  }

  /// `3 hour`
  String get hour3 {
    return Intl.message('3 hour', name: 'hour3', desc: '', args: []);
  }

  /// `4 hour`
  String get hour4 {
    return Intl.message('4 hour', name: 'hour4', desc: '', args: []);
  }

  /// `6 hour`
  String get hour6 {
    return Intl.message('6 hour', name: 'hour6', desc: '', args: []);
  }

  /// `hour`
  String get hours {
    return Intl.message('hour', name: 'hours', desc: '', args: []);
  }

  /// `New Vehicle`
  String get newVehicle {
    return Intl.message('New Vehicle', name: 'newVehicle', desc: '', args: []);
  }

  /// `Save the vehicle for later use.`
  String get savethevehicleforlateruse {
    return Intl.message(
      'Save the vehicle for later use.',
      name: 'savethevehicleforlateruse',
      desc: '',
      args: [],
    );
  }

  /// ` Add Vehicle`
  String get addvehicle {
    return Intl.message(' Add Vehicle', name: 'addvehicle', desc: '', args: []);
  }

  /// `Specify the booking duration`
  String get specifythebookingduration {
    return Intl.message(
      'Specify the booking duration',
      name: 'specifythebookingduration',
      desc: '',
      args: [],
    );
  }

  /// `Minute`
  String get minute {
    return Intl.message('Minute', name: 'minute', desc: '', args: []);
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Payment Confirmation`
  String get paymentConfirmation {
    return Intl.message(
      'Payment Confirmation',
      name: 'paymentConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Booking confirmation`
  String get bookingconfirmation {
    return Intl.message(
      'Booking confirmation',
      name: 'bookingconfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Card ending in 0000`
  String get cardendingin000 {
    return Intl.message(
      'Card ending in 0000',
      name: 'cardendingin000',
      desc: '',
      args: [],
    );
  }

  /// `New card`
  String get newcard {
    return Intl.message('New card', name: 'newcard', desc: '', args: []);
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

  /// `A new code will be sent in`
  String get anewcodewillbesentin {
    return Intl.message(
      'A new code will be sent in',
      name: 'anewcodewillbesentin',
      desc: '',
      args: [],
    );
  }

  /// `seconds`
  String get secon {
    return Intl.message('seconds', name: 'secon', desc: '', args: []);
  }

  /// `You can request a new code now`
  String get youcanrequestanewcodenow {
    return Intl.message(
      'You can request a new code now',
      name: 'youcanrequestanewcodenow',
      desc: '',
      args: [],
    );
  }

  /// `Will refresh in`
  String get willrefreshin {
    return Intl.message(
      'Will refresh in',
      name: 'willrefreshin',
      desc: '',
      args: [],
    );
  }

  /// `Extend Reservation`
  String get booking_extend {
    return Intl.message(
      'Extend Reservation',
      name: 'booking_extend',
      desc: '',
      args: [],
    );
  }

  /// `End Reservation`
  String get booking_end {
    return Intl.message(
      'End Reservation',
      name: 'booking_end',
      desc: '',
      args: [],
    );
  }

  /// `Current Bookings`
  String get booking_current_tab {
    return Intl.message(
      'Current Bookings',
      name: 'booking_current_tab',
      desc: '',
      args: [],
    );
  }

  /// `Previous Bookings`
  String get booking_previous_tab {
    return Intl.message(
      'Previous Bookings',
      name: 'booking_previous_tab',
      desc: '',
      args: [],
    );
  }

  /// `Book Again`
  String get booking_again {
    return Intl.message(
      'Book Again',
      name: 'booking_again',
      desc: '',
      args: [],
    );
  }

  /// `Booking Summary`
  String get booking_summary {
    return Intl.message(
      'Booking Summary',
      name: 'booking_summary',
      desc: '',
      args: [],
    );
  }

  /// `Book Again`
  String get booking_book_again {
    return Intl.message(
      'Book Again',
      name: 'booking_book_again',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get booking_go_home {
    return Intl.message('Home', name: 'booking_go_home', desc: '', args: []);
  }

  /// `Download Invoice`
  String get booking_download_invoice {
    return Intl.message(
      'Download Invoice',
      name: 'booking_download_invoice',
      desc: '',
      args: [],
    );
  }

  /// `Thursday 30/10/2025`
  String get booking_date_example {
    return Intl.message(
      'Thursday 30/10/2025',
      name: 'booking_date_example',
      desc: '',
      args: [],
    );
  }

  /// `08:00 AM`
  String get booking_time_start_example {
    return Intl.message(
      '08:00 AM',
      name: 'booking_time_start_example',
      desc: '',
      args: [],
    );
  }

  /// `04:00 PM`
  String get booking_time_end_example {
    return Intl.message(
      '04:00 PM',
      name: 'booking_time_end_example',
      desc: '',
      args: [],
    );
  }

  /// `Nissan / 2023 / Black`
  String get booking_car_details {
    return Intl.message(
      'Nissan / 2023 / Black',
      name: 'booking_car_details',
      desc: '',
      args: [],
    );
  }

  /// `Total Paid 30 SAR`
  String get booking_amount_paid {
    return Intl.message(
      'Total Paid 30 SAR',
      name: 'booking_amount_paid',
      desc: '',
      args: [],
    );
  }

  /// `End Reservation`
  String get booking_end_reservation {
    return Intl.message(
      'End Reservation',
      name: 'booking_end_reservation',
      desc: '',
      args: [],
    );
  }

  /// `Extend Reservation`
  String get booking_extend_reservation {
    return Intl.message(
      'Extend Reservation',
      name: 'booking_extend_reservation',
      desc: '',
      args: [],
    );
  }

  /// `Nissan / 2023 / Black`
  String get car_info_title {
    return Intl.message(
      'Nissan / 2023 / Black',
      name: 'car_info_title',
      desc: '',
      args: [],
    );
  }

  /// `Sat 30/10/2023`
  String get booking_detail_date_sample {
    return Intl.message(
      'Sat 30/10/2023',
      name: 'booking_detail_date_sample',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to end the reservation?`
  String get dialog_end_title {
    return Intl.message(
      'Do you want to end the reservation?',
      name: 'dialog_end_title',
      desc: '',
      args: [],
    );
  }

  /// `By pressing cancel, you will end the reservation and refund the paid amount.`
  String get dialog_end_message {
    return Intl.message(
      'By pressing cancel, you will end the reservation and refund the paid amount.',
      name: 'dialog_end_message',
      desc: '',
      args: [],
    );
  }

  /// `End Reservation`
  String get dialog_end_confirm {
    return Intl.message(
      'End Reservation',
      name: 'dialog_end_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to extend the reservation?`
  String get dialog_extend_title {
    return Intl.message(
      'Do you want to extend the reservation?',
      name: 'dialog_extend_title',
      desc: '',
      args: [],
    );
  }

  /// `By pressing extend, your reservation will be extended for the selected duration.`
  String get dialog_extend_message {
    return Intl.message(
      'By pressing extend, your reservation will be extended for the selected duration.',
      name: 'dialog_extend_message',
      desc: '',
      args: [],
    );
  }

  /// `Extend Reservation`
  String get dialog_extend {
    return Intl.message(
      'Extend Reservation',
      name: 'dialog_extend',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get dialog_cancel {
    return Intl.message('Cancel', name: 'dialog_cancel', desc: '', args: []);
  }

  /// `Area {code}`
  String green_parking_area(Object code) {
    return Intl.message(
      'Area $code',
      name: 'green_parking_area',
      desc: '',
      args: [code],
    );
  }

  /// `Booking Details`
  String get green_parking_details {
    return Intl.message(
      'Booking Details',
      name: 'green_parking_details',
      desc: '',
      args: [],
    );
  }

  /// `{name} | {spots}`
  String green_parking_vehicle_info(Object name, Object spots) {
    return Intl.message(
      '$name | $spots',
      name: 'green_parking_vehicle_info',
      desc: '',
      args: [name, spots],
    );
  }

  /// `{start} → {end}`
  String green_parking_time_range(Object start, Object end) {
    return Intl.message(
      '$start → $end',
      name: 'green_parking_time_range',
      desc: '',
      args: [start, end],
    );
  }

  /// `Area {code}`
  String green_parking_area_title(Object code) {
    return Intl.message(
      'Area $code',
      name: 'green_parking_area_title',
      desc: '',
      args: [code],
    );
  }

  /// `Voice recognition is not available on this device`
  String get voice_not_available {
    return Intl.message(
      'Voice recognition is not available on this device',
      name: 'voice_not_available',
      desc: '',
      args: [],
    );
  }

  /// `The position has been booked successfully`
  String get thepositionhasbeenbookedsuccessfully {
    return Intl.message(
      'The position has been booked successfully',
      name: 'thepositionhasbeenbookedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message('and', name: 'and', desc: '', args: []);
  }

  /// `/ hour`
  String get per_hour {
    return Intl.message('/ hour', name: 'per_hour', desc: '', args: []);
  }

  /// `Panorama Mall`
  String get place_location_title_1 {
    return Intl.message(
      'Panorama Mall',
      name: 'place_location_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Al Olaya is Riyadh’s ritzy commercial core, characterized by prestigious skyscrapers`
  String get place_location_subtitle_title_1 {
    return Intl.message(
      'Al Olaya is Riyadh’s ritzy commercial core, characterized by prestigious skyscrapers',
      name: 'place_location_subtitle_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Kingdom Mall`
  String get place_location_title_2 {
    return Intl.message(
      'Kingdom Mall',
      name: 'place_location_title_2',
      desc: '',
      args: [],
    );
  }

  /// `King Fahd Rd, Al Olaya, Riyadh 12214, Saudi Arabia`
  String get place_location_subtitle_title_2 {
    return Intl.message(
      'King Fahd Rd, Al Olaya, Riyadh 12214, Saudi Arabia',
      name: 'place_location_subtitle_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Panorama Mall`
  String get place_location_title_3 {
    return Intl.message(
      'Panorama Mall',
      name: 'place_location_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Al Olaya is Riyadh’s ritzy commercial core, characterized by prestigious skyscrapers`
  String get place_location_subtitle_title_3 {
    return Intl.message(
      'Al Olaya is Riyadh’s ritzy commercial core, characterized by prestigious skyscrapers',
      name: 'place_location_subtitle_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Kingdom Mall`
  String get place_location_title_4 {
    return Intl.message(
      'Kingdom Mall',
      name: 'place_location_title_4',
      desc: '',
      args: [],
    );
  }

  /// `King Fahd Rd, Al Olaya, Riyadh 12214, Saudi Arabia`
  String get place_location_subtitle_title_4 {
    return Intl.message(
      'King Fahd Rd, Al Olaya, Riyadh 12214, Saudi Arabia',
      name: 'place_location_subtitle_title_4',
      desc: '',
      args: [],
    );
  }

  /// `listening now': Find the place`
  String get search_listening_find_place {
    return Intl.message(
      'listening now\': Find the place',
      name: 'search_listening_find_place',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again.`
  String get search_an_error_occurred_try_again {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'search_an_error_occurred_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Listening now… Speak up`
  String get search_listening_now_speak {
    return Intl.message(
      'Listening now… Speak up',
      name: 'search_listening_now_speak',
      desc: '',
      args: [],
    );
  }

  /// `Try talking again`
  String get try_talking_again {
    return Intl.message(
      'Try talking again',
      name: 'try_talking_again',
      desc: '',
      args: [],
    );
  }

  /// `Extend Booking Time`
  String get extendbookingtime {
    return Intl.message(
      'Extend Booking Time',
      name: 'extendbookingtime',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Extension`
  String get confirmExtension {
    return Intl.message(
      'Confirm Extension',
      name: 'confirmExtension',
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
