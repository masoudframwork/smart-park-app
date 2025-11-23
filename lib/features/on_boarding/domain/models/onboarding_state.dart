import 'onboarding_item_models.dart';

class OnboardingState {
  final int currentIndex;
  final List<OnboardingItem> items;

  const OnboardingState({
    required this.currentIndex,
    required this.items,
  });

  OnboardingState copyWith({
    int? currentIndex,
    List<OnboardingItem>? items,
  }) {
    return OnboardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      items: items ?? this.items,
    );
  }
}
