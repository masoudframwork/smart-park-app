import 'package:aml_client/core/theme/app_color.dart';
import 'package:aml_client/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widget/custom_image_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  int _currentPage = 0;
  String _currentLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

   // _loadLanguage();
    _animationController.forward();
  }

  // Future<void> _loadLanguage() async {
  //   final language = await LocalizationService.getSavedLanguage();
  //   setState(() {
  //     _currentLanguage = language;
  //   });
  // }

  bool get _isArabic => _currentLanguage == 'العربية';

  List<IntroPage> get _pages => [
    IntroPage(
      title: _isArabic
          ? 'لماذا مكافحة غسيل الأموال مهمة'
          : 'Why AML Matters for Gold Shops',
      subtitle: _isArabic
          ? 'حماية متجر المجوهرات الخاص بك من المخاطر المالية والقانونية'
          : 'Protect your jewelry business from financial and legal risks',
      description: _isArabic
          ? 'تتطلب تجارة الذهب والمجوهرات امتثالاً صارماً لقوانين مكافحة غسيل الأموال. نظامنا يساعدك على الالتزام بجميع المتطلبات القانونية وحماية عملك من المخاطر.'
          : 'Gold and jewelry trading requires strict compliance with anti-money laundering laws. Our system helps you meet all legal requirements and protect your business from risks.',
      icon: Icons.security_outlined,
      color: AppColor.primaryBlue,
      imageUrl:
          'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=400',
    ),
    IntroPage(
      title: _isArabic ? 'ما يساعدك به التطبيق' : 'What the App Helps With',
      subtitle: _isArabic
          ? 'معرفة العملاء والمراقبة والفحص الآمن'
          : 'KYC, Monitoring, and Secure Screening',
      description: _isArabic
          ? 'من خلال أدوات متقدمة لمعرفة العملاء (KYC) ومراقبة المعاملات والفحص الآمن، يمكنك إدارة جميع متطلبات الامتثال بسهولة وكفاءة.'
          : 'With advanced KYC tools, transaction monitoring, and secure screening, you can manage all compliance requirements easily and efficiently.',
      icon: Icons.person_search_outlined,
      color: AppColor.successGreen,
      imageUrl:
          'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400',
    ),
    IntroPage(
      title: _isArabic ? 'سهل وآمن' : 'Easy and Secure',
      subtitle: _isArabic
          ? 'نظام بسيط وموثوق لإدارة الامتثال'
          : 'Simple and trusted system for compliance management',
      description: _isArabic
          ? 'واجهة سهلة الاستخدام مع أعلى معايير الأمان. ابدأ في دقائق واحصل على راحة البال مع الحماية الكاملة لبياناتك.'
          : 'User-friendly interface with the highest security standards. Get started in minutes and have peace of mind with complete data protection.',
      icon: Icons.verified_user_outlined,
      color: AppColor.infoBlue,
      imageUrl:
          '', //'https://images.pixabay.com/photo/2016/10/09/08/32/digital-1724918_1280.jpg',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      //   Navigator.of(context).pushReplacementNamed(AppRoutes.languageSelector);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    //  Navigator.of(context).pushReplacementNamed(AppRoutes.languageSelector);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _skip,
                        child: Text(
                          _isArabic ? 'تخطي' : 'Skip',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: AppColor.neutralMedium),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      final page = _pages[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Column(
                          children: [
                            const Spacer(flex: 1),
                            Container(
                              //  width: 70.w,
                              //height: 35.h,
                              width: 250.w,
                              height: 285.h,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: page.color.withValues(alpha: 0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    if (page.imageUrl != null &&
                                        page.imageUrl!.isNotEmpty)
                                      CustomImageWidget(
                                        imageUrl: page.imageUrl,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            page.color.withValues(alpha: 0.6),
                                            page.color.withValues(alpha: 0.3),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        width: 60.w,
                                        height: 60.w,
                                        decoration: BoxDecoration(
                                          color: AppColor.pureWhite.withValues(
                                            alpha: 0.9,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          page.icon,
                                          size: 30.w,
                                          color: page.color,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const Spacer(flex: 1),

                            // Content
                            Text(
                              page.title,
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppTextTheme.getTextColor(context),
                                  ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 2.h),

                            Text(
                              page.subtitle,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: page.color,
                                    fontWeight: FontWeight.w600,
                                  ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 3.h),

                            Text(
                              page.description,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: AppTextTheme.getTextColor(
                                      context,
                                      isSecondary: true,
                                    ),
                                    height: 1.6,
                                  ),
                              textAlign: TextAlign.center,
                            ),

                            const Spacer(flex: 2),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Bottom section
                Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Column(
                    children: [
                      // Page indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            //width: _currentPage == index ? 8.w : 2.w,
                            width: 28.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? AppColor.primaryBlue
                                  : AppColor.neutralLight,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Navigation buttons
                      // Row(
                      //   children: [
                      //     if (_currentPage > 0)
                      //       Expanded(
                      //         child: OutlinedButton(
                      //           onPressed: _previousPage,
                      //           style: OutlinedButton.styleFrom(
                      //             padding: EdgeInsets.symmetric(vertical: 2.h),
                      //             side: BorderSide(color: AppColor.primaryBlue),
                      //           ),
                      //           child: Text(
                      //             _isArabic ? 'السابق' : 'Previous',
                      //             style: Theme.of(context).textTheme.titleMedium
                      //                 ?.copyWith(
                      //                   color: AppColor.primaryBlue,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //           ),
                      //         ),
                      //       ),
                      //
                      //     if (_currentPage > 0) SizedBox(width: 4.w),
                      //
                      //     Expanded(
                      //       flex: _currentPage == 0 ? 1 : 1,
                      //       child: ElevatedButton(
                      //         onPressed: _nextPage,
                      //         style: ElevatedButton.styleFrom(
                      //           backgroundColor: AppColor.primaryBlue,
                      //           foregroundColor: AppColor.pureWhite,
                      //           padding: EdgeInsets.symmetric(vertical: 2.h),
                      //         ),
                      //         child: Text(
                      //           _currentPage == _pages.length - 1
                      //               ? (_isArabic ? 'ابدأ الآن' : 'Get Started')
                      //               : (_isArabic ? 'التالي' : 'Next'),
                      //           style: Theme.of(context).textTheme.titleMedium
                      //               ?.copyWith(
                      //                 color: AppColor.pureWhite,
                      //                 fontWeight: FontWeight.w600,
                      //               ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_currentPage > 0)
                            SizedBox(
                              width: 140.w,
                              child: OutlinedButton(
                                onPressed: _previousPage,
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  side: BorderSide(color: AppColor.primaryBlue),
                                ),
                                child: Text(
                                  _isArabic ? 'السابق' : 'Previous',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColor.primaryBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                          if (_currentPage > 0) SizedBox(width: 10.w),

                          SizedBox(
                            width: 140.w,
                            child: ElevatedButton(
                              onPressed: _nextPage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryBlue,
                                foregroundColor: AppColor.pureWhite,
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                              ),
                              child: Text(
                                _currentPage == _pages.length - 1
                                    ? (_isArabic ? 'ابدأ الآن' : 'Get Started')
                                    : (_isArabic ? 'التالي' : 'Next'),
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColor.pureWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

class IntroPage {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
  final String? imageUrl;

  IntroPage({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    this.imageUrl,
  });
}
// import 'package:aml_client/features/welcome_screen/presentation/onboarding/widget/onboarding_content.dart';
// import 'package:aml_client/features/welcome_screen/presentation/onboarding/widget/onboarding_image_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../provider/onboarding_prvovider.dart';
//
// class OnboardingScreen extends ConsumerWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(onboardingControllerProvider);
//     final controller = ref.read(onboardingControllerProvider.notifier);
//
//     final pages = state.pages;
//     final currentPage = state.currentPage;
//     final isArabic = state.currentLanguage == 'العربية';
//
//     if (pages.isEmpty) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     return Directionality(
//       textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               // Skip Button
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         // على سبيل المثال: التنقل خارج الـ onboarding
//                         // context.pushReplacement('/languageSelector');
//                       },
//                       child: Text(
//                         isArabic ? 'تخطي' : 'Skip',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               // PageView
//               Expanded(
//                 child: PageView.builder(
//                   controller: controller.pageController,
//                   //   controller: PageController(initialPage: currentPage),
//                   itemCount: pages.length,
//                   onPageChanged: controller.goTo,
//                   itemBuilder: (context, index) {
//                     final page = pages[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Column(
//                         children: [
//                           const Spacer(flex: 1),
//                           OnboardingImageCard(page: page),
//                           const Spacer(flex: 1),
//                           OnboardingContent(page: page),
//                           const Spacer(flex: 2),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//
//               // Page Indicator
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(pages.length, (index) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 4),
//                     width: currentPage == index ? 28 : 16,
//                     height: 8,
//                     decoration: BoxDecoration(
//                       color: currentPage == index ? Colors.blue : Colors.grey.shade300,
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   );
//                 }),
//               ),
//
//               const SizedBox(height: 16),
//
//               // Navigation Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   if (currentPage > 0)
//                     OutlinedButton(
//                       onPressed: controller.previousPage,
//                       child: Text(isArabic ? 'السابق' : 'Previous'),
//                     ),
//                   const SizedBox(width: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (currentPage == pages.length - 1) {
//                         // نهاية الـ onboarding
//                         // على سبيل المثال: التنقل للخارج
//                         // context.pushReplacement('/languageSelector');
//                       } else {
//                         controller.nextPage();
//                       }
//                     },
//                     child: Text(
//                       currentPage == pages.length - 1
//                           ? (isArabic ? 'ابدأ الآن' : 'Get Started')
//                           : (isArabic ? 'التالي' : 'Next'),
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
