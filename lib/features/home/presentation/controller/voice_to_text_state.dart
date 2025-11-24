import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class VoiceUiState {
  final bool isAvailable;
  final bool isListening;
  final String partialText;
  final String? error;
  final String locale;

  const VoiceUiState({
    required this.isAvailable,
    required this.isListening,
    required this.partialText,
    this.error,
    required this.locale,
  });

  VoiceUiState copyWith({
    bool? isAvailable,
    bool? isListening,
    String? partialText,
    String? error,
    String? locale,
  }) {
    return VoiceUiState(
      isAvailable: isAvailable ?? this.isAvailable,
      isListening: isListening ?? this.isListening,
      partialText: partialText ?? this.partialText,
      error: error,
      locale: locale ?? this.locale,
    );
  }

  static const initial = VoiceUiState(
    isAvailable: false,
    isListening: false,
    partialText: '',
    error: null,
    locale: 'ar_SA',
  );
}

final placeVoiceUiProvider =
    StateProvider<VoiceUiState>((ref) => VoiceUiState.initial);
