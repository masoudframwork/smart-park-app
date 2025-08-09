import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/onboarding_controller.dart';
import '../state/onboarding_state.dart';

final onboardingControllerProvider =
    StateNotifierProvider<OnboardingController, OnboardingState>(
      (ref) => OnboardingController(),
    );
