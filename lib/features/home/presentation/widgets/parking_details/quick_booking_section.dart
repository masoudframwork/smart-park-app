import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/features/home/presentation/widgets/parking_details/info_row.dart';

class QuickBookingSection extends StatelessWidget {
  final VoidCallback? onBookNow;

  const QuickBookingSection({super.key, this.onBookNow});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  padding: EdgeInsets.symmetric(horizontal: 14).copyWith(top: 11, bottom: 22),

      padding: EdgeInsets.symmetric(horizontal: 8).copyWith(top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.containerColor,
      ),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'الحجز السريع',
            appTextTheme: AppTextTheme.font18SimiBoldBlack()
                .copyWith(color: AppColor.blackTextColor),
          ),
          InfoRowTheme(
            image: AppImages.car,
            text: 'نيسان باثفايندر 2023 / أسود',
          ),
          InfoRowTheme(
            image: AppImages.time,
            text: '',
            suptitel: Row(
              spacing: 8.w,
              children: [
                AppText(
                    text: 'من',
                    appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                      color: AppColor.blackNumberSmallColor,
                    )),
                AppText(
                  text: '8:00 ص',
                  appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColor.blackColor,
                  ),
                ),
                AppText(
                    text: 'الي',
                    appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                      color: AppColor.blackNumberSmallColor,
                    )),
                AppText(
                  text: '4:00 ص',
                  appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
          ),
          InfoRowTheme(
            image: AppImages.visaImage,
            text: 'البطاقة المنتهية ب 000',
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: 'احجز الان',
                    appTextTheme: AppTextTheme.mainButtonTextStyle().copyWith(
                      fontSize: 14,
                    ),
                  ),
                  AppText(
                    text: '40',
                    appTextTheme: AppTextTheme.mainButtonTextStyle().copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(
                    AppImages.realSu,
                    color: AppColor.whiteColor,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
