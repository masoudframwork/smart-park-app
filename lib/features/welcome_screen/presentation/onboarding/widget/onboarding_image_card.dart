import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../widget/custom_image_widget.dart';
import '../../model/onboarding_model.dart';

class OnboardingImageCard extends StatelessWidget {
  final OnboardingPageModel page;

  const OnboardingImageCard({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 285.h,
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
            if (page.imageUrl != null && page.imageUrl!.isNotEmpty)
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
                    page.color.withOpacity(0.6),
                    page.color.withOpacity(0.3),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: AppColor.pureWhite.withOpacity(0.9),
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
    );
  }
}
