import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/features/booking/presentation/widgets/booking_widgets.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/BookingStep1Page.dart';
import 'package:smart/features/home/presentation/home_page.dart';

import '../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        body: Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      _buildBookingCard(),

                      SizedBox(height: 20.h),

                      /// Book Again Button
                      BookingWidgets.buildActionButton(
                        text: "احجز مرة أخرى",
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

                      /// Go to Home (White button with green border)
                      _buildOutlinedButton(
                        text: "الرئيسية",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomePage(),
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
    );
  }

  /// HEADER BAR
  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: const BoxDecoration(
        // color: AppColor.primaryColor,
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_rounded,
                color: Colors.white, size: 22),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: AppText(
              text: "ملخص الحجز",
              appTextTheme: AppTextTheme.titleLargeTextStyle()
                  .copyWith(color: AppColor.textColor, fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }

  /// BOOKING CARD
  Widget _buildBookingCard() {
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// Title
          AppText(
            text: "013 المنطقة",
            appTextTheme: AppTextTheme.titleLargeTextStyle()
                .copyWith(fontWeight: FontWeight.w700),
          ),

          SizedBox(height: 6.h),

          /// Address
          AppText(
            text: "طريق خريص، الرياض، المملكة العربية السعودية",
            appTextTheme: AppTextTheme.bodySmallTextStyle(),
            // maxLines: 2,
          ),

          SizedBox(height: 16.h),

          /// DIVIDER
          Divider(color: Colors.grey.shade300),

          SizedBox(height: 10.h),

          /// DATE + TIME + CAR + PRICE
          BookingWidgets.buildInfoRow(
             icon: AppImages.timerClock,
            text: "الخميس 2025/10/30",
          ),

          SizedBox(height: 8.h),

          BookingWidgets.buildTimeRow(
            startTime: "08:00 ص",
            endTime: "04:00 م",
          ),

          SizedBox(height: 8.h),

          BookingWidgets.buildInfoRow(
            icon: AppImages.car,
            text: "نيسان / 2023 / أسود",
          ),

          SizedBox(height: 8.h),

          BookingWidgets.buildInfoRow(
            icon: AppImages.realSu,
            text: "إجمالي المدفوع  30ر.س",
          ),

          SizedBox(height: 20.h),

          /// Download Invoice
          Center(
            child: TextButton.icon(
              onPressed: () {},
              icon:
                  Icon(Icons.download, color: AppColor.primaryColor, size: 20),
              label: AppText(
                text: "تحميل الفاتورة",
                appTextTheme: AppTextTheme.bodyMediumTextStyle()
                    .copyWith(color: AppColor.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Outlined WHITE BUTTON
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
