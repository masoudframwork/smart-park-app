import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/widgets/app_text.dart';
import '../../../../core/theme/app_text_theme.dart';

class TitleSubtitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final bool isIconSvg;

  const TitleSubtitleWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.isIconSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        SvgPicture.asset(
          iconPath,
          width: 107.w,
          height: 107.h,
          fit: BoxFit.contain,
        ),
         SizedBox(height: 60.h),
        AppText(
          text: title,
          textAlign: TextAlign.center,
          appTextTheme: AppTextTheme.introTitleTextStyle().copyWith(
            color:AppColor .primaryTextColor,
            fontSize: 50,
          ),
        ),
        const SizedBox(height: 12),
        AppText(
          text: subtitle,
          textAlign: TextAlign.center,
          appTextTheme: AppTextTheme.introTitleTextStyle().copyWith(
              fontSize: 30,
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
