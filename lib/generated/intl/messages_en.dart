// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "dio_generic_error": MessageLookupByLibrary.simpleMessage(
      "⚠️ Error: An error occured while fetching data",
    ),
    "dio_no_connection": MessageLookupByLibrary.simpleMessage(
      "📴 No internet connection.",
    ),
    "dio_not_found": MessageLookupByLibrary.simpleMessage("🔎 Not found."),
    "dio_request_cancelled": MessageLookupByLibrary.simpleMessage(
      "❌ Request was cancelled.",
    ),
    "dio_server_error": MessageLookupByLibrary.simpleMessage(
      "🔥 Server error. Try again later.",
    ),
    "dio_ssl_error": MessageLookupByLibrary.simpleMessage(
      "🔒 SSL certificate error.",
    ),
    "dio_timeout": MessageLookupByLibrary.simpleMessage(
      "⏱️ Connection timed out.",
    ),
    "dio_unauthorized": MessageLookupByLibrary.simpleMessage(
      "🔐 Unauthorized. Please log in again.",
    ),
    "dio_unexpected_error": MessageLookupByLibrary.simpleMessage(
      "❗ Unexpected error occurred.",
    ),
    "sampleLogo": MessageLookupByLibrary.simpleMessage("SAMPLE LOGO"),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "unknonError": MessageLookupByLibrary.simpleMessage(
      "Oops! Something went wrong. Please try again later.",
    ),
  };
}
