import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/widget/car_small_preview.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/widget/change_payment_method_bottom_sheet.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/widget/change_vehicle_dialog_widget.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/widget/selection_tile.dart';
import '../../../../core/helpers/show_change_vehicle_dialog.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/zone_header.dart';
import '../../../../core/widgets/details_reserve_parking_widget/zone_image_card_widget.dart';
import '../../../booking/booking_page.dart';
import '../../../bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import '../domain/payment_provider.dart';
import '../domain/vehicle_option.dart';
import 'widget/booking_custom_time_bottom_sheet.dart';
import 'controller/booking_summary.dart';

class BookingSummary extends ConsumerWidget {
  const BookingSummary({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingSummaryControllerProvider);
    final vehicles = ref.watch(vehicleOptionsProvider);
    final selectedIndex = ref.watch(selectedVehicleIndexProvider);
    final selected = vehicles[selectedIndex];
    final selectedPayment = ref.watch(selectedPaymentMethodProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          leading: SquareButton(
            onTap: () => Navigator.pop(context),
            icon: Image.asset(
              AppImages.arrowRightIcon,
              width: 20.w,
              height: 20.w,
              color: AppColor.primaryColor,
            ),
          ),
          trailing: CloseButtonCircle(
              onTap: () => NavigationService.go(RoutePaths.bottomNavBar)),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 15.h,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'ملخص الحجز',
                        appTextTheme: AppTextTheme.titleLargeTextStyle()
                            .copyWith(color: AppColor.blackNumberSmallColor),
                      ),
                      ZoneImageCard(),
                      ZoneHeader(
                        zoneName: ' المنطقة 013',
                        capacityText: '70/13',
                        showDurationSection: false,
                      ),
                      TimeSummaryTile(
                        start: state.start,
                        end: state.end,
                        onTap: () {
                          showBlurBottomSheet(
                            context: context,
                            child: BookingCustomTimeBottomSheet(),
                          );
                        },
                      ),

                      ///change car bottomSheet
                      GestureDetector(
                        onTap: () {
                          showBlurBottomSheet(
                            context: context,
                            child: const ChangeVehicleBottomSheet(),
                          );
                        },
                        child: SelectionTile(
                          title: selected.title,
                          trailingImage:
                              CarSmallPreview(assetSvg: selected.assetSvg),
                        ),
                      ),

                      ///change Payment bottomSheet

                      GestureDetector(
                        onTap: () {
                          showBlurBottomSheet(
                            context: context,
                            child: ChangePaymentMethodBottomSheet(),
                          );
                        },
                        child: SelectionTile(
                          title: selectedPayment?.line1 ??
                              'البطاقة المنتهية ب 0000',
                          trailingImage: Container(
                            width: 44.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(4.r),
                              // border: Border.all(
                              //   color: AppColor.contanearGreyColor,
                              //   width: 0,
                              // ),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              selectedPayment?.assetImage ??
                                  AppImages.visaImage,
                              width: 49.w,
                              height: 35.h,
                              fit: BoxFit.contain,
                              color: selectedPayment?.assetColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              CustomButtonWidget(
                text: 'تأكيد الحجز',
                onPressed: () {
                  ref.read(bottomNavBarController).changeIndex(1);

                  NavigationService.go(RoutePaths.bottomNavBar);
                },
                iconLayout: ButtonIconLayout.inlineWithNumber,
                iconOnRight: false,
                centerGap: 8,
                verticalPadding: 15,
                trailingNumber: '30',
                trailingNumberStyle: AppTextTheme.mainButtonTextStyle()
                    .copyWith(fontSize: 30, fontWeight: FontWeight.w600),
                icon: Image.asset(
                  AppImages.arrowIcon,
                  width: 21.w,
                  height: 21.w,
                  color: AppColor.whiteColor,
                ),
                riyalIcon: SvgPicture.asset(
                  AppImages.realSu,
                  color: AppColor.whiteColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
