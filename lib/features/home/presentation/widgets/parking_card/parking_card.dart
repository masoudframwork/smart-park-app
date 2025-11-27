import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/core/theme/app_color.dart';
import '../../../../../core/constants/image_string.dart';
import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../domain/models/parking_area_model.dart';

class ParkingCard extends StatelessWidget {
  final ParkingArea parkingArea;
  final VoidCallback? onTap;

  const ParkingCard({
    super.key,
    required this.parkingArea,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Directionality.of(context) == TextDirection.rtl;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 340.w,
        height: 105.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                width: 80.w,
                height: 80.h,
                color: Colors.grey.shade200,
                child: parkingArea.imageUrl != null
                    ? Image.network(parkingArea.imageUrl!, fit: BoxFit.cover)
                    : Image.asset(AppImages.parkingDemo, fit: BoxFit.cover),
              ),
            ),

            SizedBox(width: 14.w),

            /// TEXT SECTION
            Expanded(
              child: Column(
                crossAxisAlignment: isArabic
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// TITLE
                  AppText(
                    text: isArabic
                        ? "المنطقة ${parkingArea.code}"
                        : "Area ${parkingArea.code}",
                    appTextTheme:
                        AppTextTheme.activeCardTextDescStyle().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: AppColor.bottomNavigationBarColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  /// LOCATION
                  AppText(
                    text: parkingArea.location,
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                    appTextTheme:
                        AppTextTheme.activeCardTextDescStyle().copyWith(
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12.sp,
                      color: AppColor.blackNumberSmallColor,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  /// BOTTOM ROW
                  Row(
                    textDirection:
                        isArabic ? TextDirection.rtl : TextDirection.ltr,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /// PRICE
                            Row(
                              children: [
                                AppText(
                                  text: parkingArea.pricePerHour.toString(),
                                  textAlign: isArabic
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  appTextTheme:
                                      AppTextTheme.activeCardTextDescStyle()
                                          .copyWith(
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 16.sp,
                                    color: AppColor.blackNumberSmallColor,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                SvgPicture.asset(
                                  AppImages.realSu,
                                  width: 12.w,
                                  height: 12.h,
                                  color: Colors.black87,
                                ),
                                SizedBox(width: 2.w),
                                AppText(
                                  text: isArabic ? "/ ساعة" : "/ hour",
                                  textAlign: isArabic
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  appTextTheme:
                                      AppTextTheme.activeCardTextDescStyle()
                                          .copyWith(
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 10.sp,
                                    color: AppColor.blackNumberSmallColor,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 13.w),

                            /// AVAILABILITY
                            SvgPicture.asset(
                              AppImages.carIcon,
                              width: 13.w,
                              height: 13.h,
                            ),

                            SizedBox(width: 8.w),
                            Flexible(
                              child: AppText(
                                text: parkingArea.formattedAvailability,
                                textAlign:
                                    isArabic ? TextAlign.right : TextAlign.left,
                                appTextTheme:
                                    AppTextTheme.activeCardTextDescStyle()
                                        .copyWith(
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 10.sp,
                                  color: AppColor.blackNumberSmallColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 16.w),

                      /// ARROW
                      GestureDetector(
                        onTap: () {
                          NavigationService.push(
                            '/bookingParkingDetailsPage',
                            context: context,
                          );
                        },
                        child: Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6CBF4E),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
