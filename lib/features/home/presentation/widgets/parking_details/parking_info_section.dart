import 'package:flutter/material.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/features/home/data/models/parking_location.dart';
import 'info_row.dart';

class ParkingInfoSection extends StatelessWidget {
  final ParkingLocation parkingData;

  const ParkingInfoSection({super.key, required this.parkingData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: parkingData.title,
          appTextTheme: AppTextTheme.titleLargeTextStyle(),
        ),
        Row(
          children: [
            AppText(
              text: "${parkingData.price} ",
              appTextTheme: AppTextTheme.titleLargeTextStyle(),
            ),
            AppText(
              text: "ريال/ساعه",
              appTextTheme: AppTextTheme.bodySmallTextStyle()
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
        const SizedBox(height: 6),
        InfoRow(
          image: AppImages.locationDesc,
          text: parkingData.description,
        ),
        const SizedBox(height: 15),
        InfoRow(
          image: AppImages.avParkings,
          text:
              'المواقف المتاحة ${parkingData.totalSpots}/${parkingData.availableSpots}',
        ),
      ],
    );
  }
}
