import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/image_string.dart';
import '../../../../core/theme/app_color.dart' show AppColor;
import '../../../../core/widgets/custom_image_widget.dart';

class SendTheCodePage extends StatelessWidget {
  const SendTheCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: ClipOval(
                  child: CustomImageWidget(
                    isFlag: true,
                    imageUrl: AppImages.appLogo,
                    width: 147.w,
                    height: 147.w,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
