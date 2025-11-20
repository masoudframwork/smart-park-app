import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/features/booking/presentation/widgets/booking_widgets.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/BookingStep1Page.dart';
import 'package:smart/features/home/presentation/home_page.dart';

import '../../../core/widgets/custom_image_widget.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        spacing: 15,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 34.w,
              height: 34.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: AppColor.contanearGreyColor,
                  width: 1,
                ),
              ),
              child: CustomImageWidget(
                imageUrl: AppImages.arrowRightIcon,
                width: 20.w,
                height: 20.w,
                isFlag: true,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          AppText(
            text: "ملخص الحجز",
            appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
              color: AppColor.textColor,
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
        crossAxisAlignment: CrossAxisAlignment.center,   // ⭐ CENTER ALL CONTENT
        children: [

          /// Title
          AppText(
            text: "المنطقة 013",
            appTextTheme: AppTextTheme.titleLargeTextStyle()
                .copyWith(fontWeight: FontWeight.w700),
          ),

          SizedBox(height: 6.h),

          /// Address
          AppText(
            text: "طريق خريص، الرياض، المملكة العربية السعودية",
            textAlign: TextAlign.center,                   // ⭐ CENTER TEXT
            appTextTheme: AppTextTheme.bodySmallTextStyle(),
          ),

          SizedBox(height: 16.h),

          Divider(color: Colors.grey.shade300),

          SizedBox(height: 10.h),

          /// DATE
          BookingWidgets.buildInfoRow(
            icon: AppImages.timerClock,
            iconColor: AppColor.textColor,
            text: "الخميس 2025/10/30",
          ),

          SizedBox(height: 8.h),

          /// TIME
          BookingWidgets.buildTimeRow(
            startTime: "08:00 ص",
            endTime: "04:00 م",
          ),

          SizedBox(height: 8.h),

          /// CAR
          BookingWidgets.buildInfoRow(
            icon: AppImages.car,
            iconColor: AppColor.textColor,
            text: "نيسان / 2023 / أسود",
          ),

          SizedBox(height: 8.h),

          /// TOTAL PRICE
          BookingWidgets.buildInfoRow(
            icon: AppImages.realSu,
            iconColor: AppColor.textColor,
            text: "إجمالي المدفوع  30 ر.س",
          ),

          SizedBox(height: 20.h),

          /// DOWNLOAD INVOICE
          Center(
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.download_for_offline_outlined, color: AppColor.primaryColor, size: 20),
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
