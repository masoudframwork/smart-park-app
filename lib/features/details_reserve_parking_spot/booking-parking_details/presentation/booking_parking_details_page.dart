import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/features/details_reserve_parking_spot/booking-parking_details/presentation/widget/additional_services.dart';
import 'package:smart/features/details_reserve_parking_spot/booking-parking_details/presentation/widget/day_pice_card.dart';
import 'package:smart/features/details_reserve_parking_spot/booking-parking_details/presentation/widget/zone_header.dart';
import 'package:smart/features/details_reserve_parking_spot/booking-parking_details/presentation/widget/zone_image_card.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/routing/navigation_service.dart';

import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';

class BookingParkingDetailsPage extends StatelessWidget {
  const BookingParkingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteBackgroundColor,
        body: Column(
          children: [
            ZoneImageCard(),
            ZoneHeader(
              //المنطقة 013
              zoneName: S.of(context).zone013,
              //المواقف المتاحة 70/13
              capacityText: S.of(context).availableparking,
              //طريق خريص، الرياض، المملكة العربية السعودية
              locationText: S.of(context).khuraisRoadRiyadhSaudiArabia,
              leadingIcon: SvgPicture.asset(AppImages.iconsMaps),
            ),
            DayPriceCard(),

            SizedBox(height: 22.h),
            AdditionalServicesSection(),
            SizedBox(height: 22.h),
            ZoneHeader(
              zoneName: S.of(context).aboutthispark,
              zoneNameTextStyle: AppTextTheme.titleMediumTextStyle().copyWith(
                color: AppColor.textColor,
                fontWeight: FontWeight.w600,
              ),
              locationText: S
                  .of(context)
                  .Itisalongestablishedfactthatthereadablecontentofapage,
            ),
            Spacer(),
            CustomButtonWidget(
              text: S.of(context).bookHere,
              type: ButtonType.elevated,
              onPressed: () {
                NavigationService.push(
                  '/bookingStep1Page',
                  context: context,
                );
              },
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
