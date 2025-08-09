import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_color.dart';
import '../model/onboarding_model.dart';
import '../state/onboarding_state.dart';


class OnboardingController extends StateNotifier<OnboardingState> {
  OnboardingController() : super(OnboardingState(


    currentPage: 0,
    currentLanguage: 'English',
    pages: [],
  )) {
    _loadLanguage();
  }

  bool get isArabic => state.currentLanguage == 'العربية';

  Future<void> _loadLanguage() async {
    // final savedLang = await LocalizationService.getSavedLanguage();
    //
    // final pages = _buildPages(savedLang);
    //
    // state = state.copyWith(
    //   currentLanguage: savedLang,
    //   pages: pages,
    // );
  }

  List<OnboardingPageModel> _buildPages(String lang) {
    final isArabic = lang == 'العربية';
    return [
      OnboardingPageModel(
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
        imageUrl: 'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=400',
      ),
      OnboardingPageModel(
        title: isArabic ? 'ما يساعدك به التطبيق' : 'What the App Helps With',
        subtitle: isArabic
            ? 'معرفة العملاء والمراقبة والفحص الآمن'
            : 'KYC, Monitoring, and Secure Screening',
        description: isArabic
            ? 'من خلال أدوات متقدمة لمعرفة العملاء (KYC) ومراقبة المعاملات والفحص الآمن، يمكنك إدارة جميع متطلبات الامتثال بسهولة وكفاءة.'
            : 'With advanced KYC tools, transaction monitoring, and secure screening, you can manage all compliance requirements easily and efficiently.',
        icon: Icons.person_search_outlined,
        color: AppColor.successGreen,
        imageUrl: 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400',
      ),
      OnboardingPageModel(
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
  }

  // void nextPage() {
  //   if (state.currentPage < state.pages.length - 1) {
  //     state = state.copyWith(currentPage: state.currentPage + 1);
  //   }
  // }

  // void previousPage() {
  //   if (state.currentPage > 0) {
  //     state = state.copyWith(currentPage: state.currentPage - 1);
  //   }
  // }

  // void goTo(int index) {
  //   if (index >= 0 && index < state.pages.length) {
  //     state = state.copyWith(currentPage: index);
  //   }
  // }

  void changeLanguage(String newLang) {
    final pages = _buildPages(newLang);
    state = state.copyWith(
      currentLanguage: newLang,
      pages: pages,
      currentPage: 0,
    );
  }


  late final PageController pageController;




  // OnboardingController() : super(/* initial state */) {
  //   pageController = PageController(initialPage: state.currentPage);
  //   _loadLanguage();
  // }

  //bool get isArabic => state.currentLanguage == 'العربية';


  void nextPage() {
    if (state.currentPage < state.pages.length - 1) {
      final newPage = state.currentPage + 1;
      state = state.copyWith(currentPage: newPage);
      pageController.animateToPage(
        newPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (state.currentPage > 0) {
      final newPage = state.currentPage - 1;
      state = state.copyWith(currentPage: newPage);
      pageController.animateToPage(
        newPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goTo(int index) {
    if (index >= 0 && index < state.pages.length) {
      state = state.copyWith(currentPage: index);
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }








}
