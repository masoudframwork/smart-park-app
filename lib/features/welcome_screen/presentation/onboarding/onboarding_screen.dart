import 'package:aml_client/features/welcome_screen/presentation/onboarding/widget/intro_page_widget.dart';
import 'package:aml_client/features/welcome_screen/presentation/onboarding/widget/navigation_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/splash_notifier.dart';

class OnboardingScreen extends HookConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(introWalkthroughControllerProvider);
    final controller = ref.read(introWalkthroughControllerProvider.notifier);

    final pageController = usePageController(initialPage: state.currentPage);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients && pageController.page?.round() != state.currentPage) {
          pageController.jumpToPage(state.currentPage);
        }
      });
      return null;
    }, [state.currentPage]);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button row
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                    //  Navigator.of(context).pushReplacementNamed('/languageSelector');
                    },
                    child: const Text('Skip'),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: controller.setCurrentPage,
                itemCount: state.pages.length,
                itemBuilder: (context, index) {
                  final page = state.pages[index];
                  return IntroPageWidget(page: page);
                },
              ),
            ),

            NavigationButtons(
              pageController: pageController,
              onSkip: () {


              },
              onNext: () {
                final isLastPage = state.currentPage == state.pages.length - 1;
                if (isLastPage) {
                 // Navigator.of(context).pushReplacementNamed('/languageSelector');
                } else {
                  controller.setCurrentPage(state.currentPage + 1);
                  pageController.animateToPage(
                    state.currentPage + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              onPrevious: () {
                if (state.currentPage > 0) {
                  controller.setCurrentPage(state.currentPage - 1);
                  pageController.animateToPage(
                    state.currentPage - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}