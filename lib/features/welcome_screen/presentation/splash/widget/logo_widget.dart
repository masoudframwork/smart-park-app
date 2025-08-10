import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/image_string.dart';
import '../../../../../core/theme/app_color.dart';
import 'app_title_widget.dart';

class LogoWidget extends StatelessWidget {
  final double fadeValue;
  final double scaleValue;
  final double slideValue;

  const LogoWidget({
    super.key,
    required this.fadeValue,
    required this.scaleValue,
    required this.slideValue,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: fadeValue,
      child: Transform.scale(
        scale: scaleValue,
        child: Transform.translate(
          offset: Offset(0, slideValue * 100),
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
                    child: Image.asset(
                      AImages.appLogo,
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
