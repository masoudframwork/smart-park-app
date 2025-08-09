import '../model/onboarding_model.dart';

class OnboardingState {
  final int currentPage;
  final String currentLanguage;
  final List<OnboardingPageModel> pages;

  OnboardingState({
    required this.currentPage,
    required this.currentLanguage,
    required this.pages,
  });

  OnboardingState copyWith({
    int? currentPage,
    String? currentLanguage,
    List<OnboardingPageModel>? pages,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      currentLanguage: currentLanguage ?? this.currentLanguage,
      pages: pages ?? this.pages,
    );
  }
}
