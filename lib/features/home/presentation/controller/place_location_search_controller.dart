import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../data/models/place_location_model.dart';
import 'voice_to_text_state.dart';

final placeSearchControllerProvider = StateNotifierProvider.autoDispose<
    PlaceSearchController, AsyncValue<List<PlaceLocationModel>>>(
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
  static const List<PlaceLocationModel> _all = [
    PlaceLocationModel(
        title: 'بانوراما مول',
        subtitle: 'الرياض، العليا، المملكة العربية السعودية'),
    PlaceLocationModel(
        title: 'مول المملكة',
        subtitle: 'الرياض، العليا، المملكة العربية السعودية'),
    PlaceLocationModel(
        title: 'بانوراما مول',
        subtitle: 'الرياض، العليا، المملكة العربية السعودية'),
    PlaceLocationModel(
        title: 'مول المملكة',
        subtitle: 'الرياض، العليا، المملكة العربية السعودية'),
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
      debugLogging: false,
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
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) {
      state = const AsyncValue.loading();
      await Future<void>.delayed(const Duration(milliseconds: 100));
      state = const AsyncValue.data(_all);
      return;
    }

    state = const AsyncValue.loading();
    try {
      await Future<void>.delayed(const Duration(milliseconds: 250));
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

  void searchWithDebounce(
      {Duration delay = const Duration(milliseconds: 300)}) {
    _debounce?.cancel();
    _debounce = Timer(delay, searchNow);
  }

  void clear() {
    _debounce?.cancel();
    _query = '';
    textCtrl.clear();
    state = const AsyncValue.data(_all);
  }

  Future<void> startVoice({String localeId = 'ar_SA'}) async {
    await _ensureSpeechReady();
    final voice = _ref.read(placeVoiceUiProvider);

    if (!voice.isAvailable) {
      _ref.read(placeVoiceUiProvider.notifier).state =
          voice.copyWith(error: 'التعرّف الصوتي غير متاح على هذا الجهاز.');
      return;
    }

    _ref.read(placeVoiceUiProvider.notifier).state =
        voice.copyWith(isListening: true, partialText: '', error: null);

    await _stt.listen(
      localeId: localeId,
      listenMode: stt.ListenMode.search,
      partialResults: true,
      onResult: (result) {
        final words = result.recognizedWords;
        textCtrl.value = TextEditingValue(
          text: words,
          selection: TextSelection.collapsed(offset: words.length),
        );
        setQuery(words);
        searchWithDebounce();

        final v = _ref.read(placeVoiceUiProvider);
        _ref.read(placeVoiceUiProvider.notifier).state =
            v.copyWith(partialText: words);
      },
      pauseFor: const Duration(seconds: 5),
      listenFor: const Duration(seconds: 15),
    );
  }

  Future<void> stopVoice({bool commitSearch = true}) async {
    if (_stt.isListening) {
      await _stt.stop();
    }
    final v = _ref.read(placeVoiceUiProvider);
    _ref.read(placeVoiceUiProvider.notifier).state =
        v.copyWith(isListening: false);

    if (commitSearch) {
      setQuery(textCtrl.text);
      await searchNow();
    }
  }

  Future<void> cancelVoice() async {
    if (_stt.isListening) {
      await _stt.cancel();
    }
    final v = _ref.read(placeVoiceUiProvider);
    _ref.read(placeVoiceUiProvider.notifier).state =
        v.copyWith(isListening: false, partialText: '');
  }

  Future<void> toggleVoice() async {
    final v = _ref.read(placeVoiceUiProvider);
    if (v.isListening) {
      await stopVoice(commitSearch: true);
    } else {
      await startVoice(localeId: 'ar_SA');
    }
  }

  void _onSpeechStatus(String status) {
    if (status.toLowerCase().contains('notlistening') ||
        status.toLowerCase().contains('done')) {
      final v = _ref.read(placeVoiceUiProvider);
      _ref.read(placeVoiceUiProvider.notifier).state =
          v.copyWith(isListening: false);
    }
  }

  void _onSpeechError(SpeechRecognitionError err) {
    final v = _ref.read(placeVoiceUiProvider);
    _ref.read(placeVoiceUiProvider.notifier).state =
        v.copyWith(isListening: false, error: err.errorMsg);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    textCtrl.dispose();
    _stt.cancel();
    super.dispose();
  }
}
