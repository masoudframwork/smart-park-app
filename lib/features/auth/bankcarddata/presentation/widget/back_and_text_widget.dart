import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class BackAndTextWidget extends StatelessWidget {
  const BackAndTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 17.w,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
              width: 34.w,
              height: 34.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: AppColor.contanearGreyColor,
                  width: 1,
                ),
              ),
              child: Image.asset(
                AppImages.arrowRightIcon,
                width: 20.w,
                color: AppColor.primaryColor,
              )),
        ),
        AppText(
            text: 'بيانات البطاقة البنكية',
            appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
              color: AppColor.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
