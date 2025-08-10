import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../domain/splash_state.dart';

class IntroPageWidget extends StatelessWidget {
  final IntroPage page;
  const IntroPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Container(
            width: 270.w,
            height: 280.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: page.color.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  if(page.imageUrl!.isNotEmpty)
                  Image.asset(
                    page.imageUrl!,
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
                          page.color.withOpacity(0.6),
                          page.color.withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        color: AppColor.pureWhite.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        page.icon,
                        size: 40.w,
                        color: page.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(flex: 1),

          Text(
            page.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppTextTheme.getTextColor(context),
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 2.h),

          Text(
            page.subtitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: page.color,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 3.h),

          Text(
            page.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppTextTheme.getTextColor(context, isSecondary: true),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
