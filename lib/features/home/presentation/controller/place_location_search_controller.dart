import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../../generated/l10n.dart';
import '../../data/models/place_location_model.dart';
import 'voice_to_text_state.dart';

final placeSearchControllerProvider =
StateNotifierProvider.autoDispose<PlaceSearchController,
    AsyncValue<List<PlaceLocationModel>>>(
      (ref) => PlaceSearchController(ref),
);

class PlaceSearchController
    extends StateNotifier<AsyncValue<List<PlaceLocationModel>>> {

  PlaceSearchController(this._ref) : super(const AsyncValue.loading()) {
    _init();
  }

  final Ref _ref;
  String _query = '';
  String get query => _query;

  final TextEditingController textCtrl = TextEditingController();
  Timer? _debounce;

  final stt.SpeechToText _stt = stt.SpeechToText();
  bool _speechInitialized = false;

  /// 🔥 Mock data in BOTH Arabic + English
  static const List<PlaceLocationModel> _all = [
    // Arabic
    PlaceLocationModel(
        title: 'بانوراما مول',
        subtitle: 'الرياض، العليا، المملكة العربية السعودية'),
    PlaceLocationModel(
        title: 'مول المملكة',
        subtitle: 'الرياض، العليا، المملكة العربية السعودية'),

    // English
    PlaceLocationModel(
        title: 'Panorama Mall',
        subtitle: 'Riyadh, Olaya, Saudi Arabia'),
    PlaceLocationModel(
        title: 'Kingdom Mall',
        subtitle: 'Riyadh, Olaya, Saudi Arabia'),
  ];

  Future<void> _init() async {
    unawaited(_ensureSpeechReady());
    textCtrl.clear();
    _query = '';
    state = const AsyncValue.data(_all);
  }

  Future<void> _ensureSpeechReady() async {
    if (_speechInitialized) return;

    final available = await _stt.initialize(
      onStatus: _onSpeechStatus,
      onError: _onSpeechError,
    );

    _speechInitialized = true;

    final voice = _ref.read(placeVoiceUiProvider);
    _ref.read(placeVoiceUiProvider.notifier).state =
        voice.copyWith(isAvailable: available, error: null);
  }

  void setQuery(String value) {
    _query = value;
  }

  Future<void> searchNow() async {
    final locale = _ref.read(placeVoiceUiProvider).locale;

    final q = _query.trim().toLowerCase();
    if (q.isEmpty) {
      state = const AsyncValue.data(_all);
      return;
    }

    state = const AsyncValue.loading();

    await Future<void>.delayed(const Duration(milliseconds: 200));

    try {
      final results = _all.where((p) {
        final t = p.title.toLowerCase();
        final s = p.subtitle.toLowerCase();
        return t.contains(q) || s.contains(q);
      }).toList();

      state = AsyncValue.data(results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void searchWithDebounce({Duration delay = const Duration(milliseconds: 300)}) {
    _debounce?.cancel();
    _debounce = Timer(delay, searchNow);
  }

  void clear() {
    _debounce?.cancel();
    _query = '';
    textCtrl.clear();
    state = const AsyncValue.data(_all);
  }

  /// 🔥 Voice Recognition Supports Arabic + English Automatically
  Future<void> startVoice(BuildContext context) async {
    await _ensureSpeechReady();

    final uiState = _ref.read(placeVoiceUiProvider);

    if (!uiState.isAvailable) {
      _ref.read(placeVoiceUiProvider.notifier).state = uiState.copyWith(
        error: S.of(context).voice_not_available,
      );
      return;
    }

    // 🔥 Detect current app language
    final locale = Localizations.localeOf(context);
    final langCode = locale.languageCode == 'ar' ? 'ar_SA' : 'en_US';

    _ref.read(placeVoiceUiProvider.notifier).state =
        uiState.copyWith(isListening: true, error: null);

    await _stt.listen(
      localeId: langCode,
      listenMode: stt.ListenMode.search,
      partialResults: true,
      onResult: (result) {
        final text = result.recognizedWords;

        textCtrl.value = TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );

        setQuery(text);
        searchWithDebounce();
      },
    );
  }


  Future<void> stopVoice({bool commitSearch = true}) async {
    if (_stt.isListening) await _stt.stop();

    if (commitSearch) {
      setQuery(textCtrl.text);
      await searchNow();
    }

    final v = _ref.read(placeVoiceUiProvider);
    _ref.read(placeVoiceUiProvider.notifier).state =
        v.copyWith(isListening: false);
  }

  Future<void> cancelVoice() async {
    if (_stt.isListening) await _stt.cancel();

    final v = _ref.read(placeVoiceUiProvider);
    _ref.read(placeVoiceUiProvider.notifier).state =
        v.copyWith(isListening: false);
  }

  Future<void> toggleVoice(BuildContext context) async {
    final v = _ref.read(placeVoiceUiProvider);
    if (v.isListening) {
      await stopVoice();
    } else {
      await startVoice(context);
    }
  }

  void _onSpeechStatus(String status) {
    if (status.toLowerCase().contains("notlistening") ||
        status.toLowerCase().contains("done")) {
      final v = _ref.read(placeVoiceUiProvider);
      _ref.read(placeVoiceUiProvider.notifier).state =
          v.copyWith(isListening: false);
    }
  }

  void _onSpeechError(SpeechRecognitionError err) {
    final voice = _ref.read(placeVoiceUiProvider);
    _ref.read(placeVoiceUiProvider.notifier).state = voice.copyWith(
      isListening: false,
      error: err.errorMsg,
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    textCtrl.dispose();
    _stt.cancel();
    super.dispose();
  }
}
