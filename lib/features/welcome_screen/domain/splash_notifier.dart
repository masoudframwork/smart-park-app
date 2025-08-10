import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/image_string.dart';
import '../../../core/theme/app_color.dart';
import 'splash_state.dart';

// Splash Notifier
final splashNotifierProvider =
    StateNotifierProvider<SplashNotifier, SplashState>(
      (ref) => SplashNotifier()..start(),
    );

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(const SplashState());

  Future<void> start() async {
    for (double v = 0.0; v <= 1.0; v += 0.05) {
      state = state.copyWith(fadeValue: v);
      await Future.delayed(const Duration(milliseconds: 30));
    }

    for (double v = 0.7; v <= 1.0; v += 0.05) {
      state = state.copyWith(scaleValue: v);
      await Future.delayed(const Duration(milliseconds: 30));
    }

    for (double v = 0.3; v >= 0.0; v -= 0.05) {
      state = state.copyWith(slideValue: v);
      await Future.delayed(const Duration(milliseconds: 30));
    }

    state = state.copyWith(
      showProgress: true,
      loadingText: "Loading security protocols...",
    );
    await Future.delayed(const Duration(seconds: 2));

    state = state.copyWith(loadingText: "Preparing compliance dashboard...");
    await Future.delayed(const Duration(seconds: 1));

    state = state.copyWith(navigateNext: true);
  }
}

// Intro Walkthrough Controller
final introWalkthroughControllerProvider =
    StateNotifierProvider<IntroWalkthroughController, IntroWalkthroughState>(
      (ref) => IntroWalkthroughController(),
    );

class IntroWalkthroughController extends StateNotifier<IntroWalkthroughState> {
  IntroWalkthroughController() : super(IntroWalkthroughState()) {
    _initPages();
  }
  void _initPages() {
    final isArabic = state.currentLanguage == 'العربية';
    final pages = [
      IntroPage(
        title: isArabic
            ? 'لماذا مكافحة غسيل الأموال مهمة'
            : 'Why AML Matters for Gold Shops',
        subtitle: isArabic
            ? 'حماية متجر المجوهرات الخاص بك من المخاطر المالية والقانونية'
            : 'Protect your jewelry business from financial and legal risks',
        description: isArabic
            ? 'تتطلب تجارة الذهب والمجوهرات امتثالاً صارماً لقوانين مكافحة غسيل الأموال. نظامنا يساعدك على الالتزام بجميع المتطلبات القانونية وحماية عملك من المخاطر.'
            : 'Gold and jewelry trading requires strict compliance with anti-money laundering laws. Our system helps you meet all legal requirements and protect your business from risks.',
        icon: Icons.security_outlined,
        color: AppColor.primaryBlue,
        imageUrl: AImages.intro1,
      ),
      IntroPage(
        title: isArabic ? 'ما يساعدك به التطبيق' : 'What the App Helps With',
        subtitle: isArabic
            ? 'معرفة العملاء والمراقبة والفحص الآمن'
            : 'KYC, Monitoring, and Secure Screening',
        description: isArabic
            ? 'من خلال أدوات متقدمة لمعرفة العملاء (KYC) ومراقبة المعاملات والفحص الآمن، يمكنك إدارة جميع متطلبات الامتثال بسهولة وكفاءة.'
            : 'With advanced KYC tools, transaction monitoring, and secure screening, you can manage all compliance requirements easily and efficiently.',
        icon: Icons.person_search_outlined,
        color: AppColor.successGreen,
        imageUrl: AImages.intro2,
      ),
      IntroPage(
        title: isArabic ? 'سهل وآمن' : 'Easy and Secure',
        subtitle: isArabic
            ? 'نظام بسيط وموثوق لإدارة الامتثال'
            : 'Simple and trusted system for compliance management',
        description: isArabic
            ? 'واجهة سهلة الاستخدام مع أعلى معايير الأمان. ابدأ في دقائق واحصل على راحة البال مع الحماية الكاملة لبياناتك.'
            : 'User-friendly interface with the highest security standards. Get started in minutes and have peace of mind with complete data protection.',
        icon: Icons.verified_user_outlined,
        color: AppColor.infoBlue,
        imageUrl: '',
      ),
    ];

    state = state.copyWith(pages: pages);
  }

  void setCurrentPage(int page) {
    if (page >= 0 && page < state.pages.length) {
      state = state.copyWith(currentPage: page);
    }
  }

  void setLanguage(String language) {
    state = state.copyWith(currentLanguage: language);
    _initPages();
  }
}
