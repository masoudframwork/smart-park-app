import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../model/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingPageModel page;

  const OnboardingContent({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
