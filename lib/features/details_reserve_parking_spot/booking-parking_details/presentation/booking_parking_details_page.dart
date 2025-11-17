import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/features/details_reserve_parking_spot/booking-parking_details/presentation/widget/about_zone_section.dart';
import 'package:smart/features/details_reserve_parking_spot/booking-parking_details/presentation/widget/additional_services.dart';
import 'package:smart/features/details_reserve_parking_spot/booking-parking_details/presentation/widget/day_pice_card.dart';
import 'package:smart/features/details_reserve_parking_spot/booking-parking_details/presentation/widget/zone_header.dart';
import 'package:smart/features/details_reserve_parking_spot/booking-parking_details/presentation/widget/zone_image_card.dart';

import '../../../../core/constants/image_string.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/widgets/custom_button.dart';

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
              zoneName: 'المنطقة 013',
              capacityText: 'المواقف المتاحة 70/13',
              locationText: 'طريق خريص، الرياض، المملكة العربية السعودية',
              leadingIcon: SvgPicture.asset(AppImages.iconsMaps),
            ),
            DayPriceCard(),
            SizedBox(height: 22.h),
            AdditionalServicesSection(),
            SizedBox(height: 22.h),
            AboutZoneSection(
              title: 'عن هذا المصف',
              description:
                  'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي \nالقارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة\n التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ',
            ),
            Spacer(),
            CustomButtonWidget(
              text: 'احجز هنا',
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
