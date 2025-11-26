import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/features/home/data/models/parking_location.dart';
import '../../../../../core/theme/app_color.dart';
import 'info_row.dart';

class ParkingInfoSection extends StatelessWidget {
  final ParkingLocation parkingData;

  const ParkingInfoSection({super.key, required this.parkingData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          AppText(
            text: parkingData.title,
            appTextTheme:
                AppTextTheme.titleLargeTextStyle().copyWith(fontSize: 24.sp),
          ),
          const Spacer(),
          _buildIconsButton(AppImages.shipping),
          const SizedBox(width: 10),
          _buildIconsButton(AppImages.charging),
        ]),
        Row(
          children: [
            AppText(
              text: "${parkingData.price} ",
              appTextTheme: AppTextTheme.titleLargeTextStyle().copyWith(
                color: AppColor.blackTextColor,
              ),
            ),
            SvgPicture.asset(
              AppImages.realSu,
            ),
            AppText(
                text: "/ساعه",
                appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                  color: AppColor.blackNumberSmallColor,
                  fontSize: 12,
                )),
          ],
        ),
        SizedBox(height: 8.h),
        InfoRow(
          image: AppImages.locationDesc,
          text: parkingData.description,
        ),
        SizedBox(height: 8.h),
        InfoRow(
          image: AppImages.avParkings,
          text:
              'المواقف المتاحة ${parkingData.totalSpots}/${parkingData.availableSpots}',
        ),
      ],
    );
  }
}

Widget _buildIconButton(IconData icon, Color color) {
  return Container(
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      color: AppColor.secondaryColor,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Icon(icon, color: color, size: 18.sp),
  );
}

Widget _buildIconsButton(String assetPath) {
  return Container(
    padding: EdgeInsets.all(2.h),
    decoration: const BoxDecoration(
      color: AppColor.secondaryColor,
      shape: BoxShape.circle,
    ),
    child: SvgPicture.asset(assetPath),
  );
}
