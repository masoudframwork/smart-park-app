import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/features/home/presentation/widgets/parking_details/info_row.dart';

import '../../../../../core/widgets/custom_button.dart';

class QuickBookingSection extends StatelessWidget {
  final VoidCallback? onBookNow;

  const QuickBookingSection({super.key, this.onBookNow});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.containerColor,
      padding:
          EdgeInsets.symmetric(horizontal: 14).copyWith(top: 11, bottom: 22),
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'الحجز السريع',
            appTextTheme: AppTextTheme.font18SimiBoldBlack(),
          ),
          InfoRow(
            image: AppImages.car,
            text: 'نيسان باثفايندر 2023 / أسود',
          ),
          InfoRow(
            image: AppImages.time,
            text: 'من 8:00 ص إلى 4:00 م',
          ),
          InfoRow(
            image: AppImages.visa,
            text: 'البطاقة المنتهية ب 000',
          ),
          CustomButtonWidget(
            onPressed: () {},
            text: "احجز الآن 40 ريال",
          )
        ],
      ),
    );
  }
}
