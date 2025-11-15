import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/onboarding_item_models.dart';
import '../../domain/models/onboarding_state.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/constants/image_string.dart';

final onboardingControllerProvider =
    AutoDisposeNotifierProvider<OnboardingController, OnboardingState>(
  OnboardingController.new,
);

class OnboardingController extends AutoDisposeNotifier<OnboardingState> {
  late final PageController pageController;

  @override
  OnboardingState build() {
    pageController = PageController();

    ref.onDispose(() => pageController.dispose());

    final items = <OnboardItem>[
      OnboardItem(
        bgImage: AppImages.intro1,
        icon: AppImages.iconIntro1,
        title: 'اركـــــن مركبتك\n بكل ســــــهولة!',
        subtitle:
            'اســـــــتكـشــــــــــــــــف الخريطة \nواحصل على أقرب موقف\n في أي وقت ومن أي مكان',
      ),
      OnboardItem(
        bgImage: AppImages.intro2,
        icon: AppImages.iconIntro2,
        title: 'لا مزيد من \nالبحث والتعب',
        subtitle: 'احجز موقفك في أقصر وقت \nوانطلق بثقة',
      ),
      OnboardItem(
        bgImage: AppImages.intro3,
        icon: AppImages.iconIntro3,
        title: 'تغيير في المواعيد؟ \nلا مشكلة',
        subtitle: 'مدد حجزك بسهولة\n واستمتع بوقتك دون\n قلق أو مخالفات',
      ),
    ];

    return OnboardingState(currentIndex: 0, items: items);
  }

  void onPageChanged(int i) {
    state = state.copyWith(currentIndex: i);
  }

  void next() {
    final i = state.currentIndex;
    if (i < state.items.length - 1) {
      pageController.animateToPage(
        i + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      NavigationService.go(RoutePaths.loginPage);

    }
  }

  void prev() {
    final i = state.currentIndex;
    if (i > 0) {
      pageController.animateToPage(
        i - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void onSkip() {
    NavigationService.go(RoutePaths.bottomNavBar);
  }
}
