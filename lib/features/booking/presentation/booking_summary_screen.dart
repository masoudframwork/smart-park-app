import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/features/booking/presentation/widgets/booking_widgets.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/BookingStep1Page.dart';
import 'package:smart/features/home/presentation/home_page.dart';
import 'package:smart/generated/l10n.dart';
import '../../../core/widgets/arrow_widget_custom_bar.dart';
import '../../../core/widgets/custom_image_widget.dart';
import '../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return SafeArea(
      child: Directionality(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: AppColor.settingsBackgroundColor,
          appBar: CustomAppBar(
            backgroundColor: AppColor.backgroundAppBarColor,
            leading: CircleImageButton(
              onTap: () {},
              imageUrl: AppImages.appLogo,
              size: 37,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [

                ArrowWidgetCustomBar(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  title: S.of(context).terms_title,
                ),

                SizedBox(height: 16.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          _buildBookingCard(context, isRTL),

                          SizedBox(height: 20.h),

                          /// ⭐ Button: Book Again
                          BookingWidgets.buildActionButton(
                            text: S.of(context).booking_book_again,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BookingStep1Page(),
                                ),
                              );
                            },
                            backgroundColor: AppColor.primaryColor,
                            height: 50,
                            fontSize: 16,
                          ),

                          SizedBox(height: 12.h),

                          /// ⭐ Button: Go Home
                          _buildOutlinedButton(
                            text: S.of(context).booking_go_home,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomePage(),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  // ---------------------------------------------------------------------------
  // BOOKING CARD
  // ---------------------------------------------------------------------------

  Widget _buildBookingCard(BuildContext context, bool isRTL) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title
          AppText(
            text: S.of(context).zone013,
            appTextTheme: AppTextTheme.titleLargeTextStyle()
                .copyWith(fontWeight: FontWeight.w700),
          ),

          SizedBox(height: 6.h),

          /// Address
          AppText(
            text: S.of(context).zone013KhuraisRoadRiyadhKingdomofSaudiArabia,
            textAlign: TextAlign.center,
            appTextTheme: AppTextTheme.bodySmallTextStyle(),
          ),

          SizedBox(height: 16.h),

          Divider(color: Colors.grey.shade300),

          SizedBox(height: 10.h),

          /// DATE
          BookingWidgets.buildInfoRow(
            icon: AppImages.timerClock,
            iconColor: AppColor.textColor,
            text: S.of(context).booking_date_example,
          ),

          SizedBox(height: 8.h),

          /// TIME
          BookingWidgets.buildTimeRow(
            context,
            startTime: S.of(context).booking_time_start_example,
            endTime: S.of(context).booking_time_end_example,
          ),

          SizedBox(height: 8.h),

          /// CAR
          BookingWidgets.buildInfoRow(
            icon: AppImages.car,
            iconColor: AppColor.textColor,
            text: S.of(context).booking_car_details,
          ),

          SizedBox(height: 8.h),

          /// PRICE
          BookingWidgets.buildInfoRow(
            icon: AppImages.realSu,
            iconColor: AppColor.textColor,
            text: S.of(context).booking_amount_paid,
          ),

          SizedBox(height: 20.h),

          /// DOWNLOAD INVOICE
          Center(
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.download_for_offline_outlined,
                color: AppColor.primaryColor,
                size: 20,
              ),
              label: AppText(
                text: S.of(context).booking_download_invoice,
                appTextTheme: AppTextTheme.bodyMediumTextStyle()
                    .copyWith(color: AppColor.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // OUTLINED BUTTON
  // ---------------------------------------------------------------------------

  Widget _buildOutlinedButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColor.primaryColor, width: 1.5),
        ),
        child: AppText(
          text: text,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            color: AppColor.primaryColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
