import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../widget/custom_image_widget.dart';
import 'app_title_widget.dart';

class LogoWidget extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;
  final Animation<Offset> slideAnimation;

  const LogoWidget({
    super.key,
    required this.fadeAnimation,
    required this.scaleAnimation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: SlideTransition(
          position: slideAnimation,
          child: Column(
            children: [
              Container(
                width: 99.w,
                height: 99.w,
                decoration: BoxDecoration(
                  color: AppColor.pureWhite.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.pureWhite.withOpacity(0.3),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.darkBase.withOpacity(0.3),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: Center(
                  child: ClipOval(
                    child: CustomImageWidget(
                      imageUrl:
                          'https://www.frameworktechs.com/assets/images/soiner.PNG',
                      width: 70.w,
                      height: 70.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              const AppTitleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
