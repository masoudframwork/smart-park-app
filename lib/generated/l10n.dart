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

  /// `Fines`
  String get profile_fines {
    return Intl.message('Fines', name: 'profile_fines', desc: '', args: []);
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

  /// `Nissan Pathfinder 2023 / Blackد`
  String get nissanPathfinderBlack {
    return Intl.message(
      'Nissan Pathfinder 2023 / Blackد',
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
