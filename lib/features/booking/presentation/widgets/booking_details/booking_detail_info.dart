import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/features/booking/domain/models/booking_model.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_image_widget.dart';

class BookingDetailInfo extends StatelessWidget {
  final BookingModel reservation;

  const BookingDetailInfo({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLocationInfo(),
        SizedBox(height: 16.h),
        _buildCarInfo(),
        SizedBox(height: 16.h),
        _buildPaymentRow(),
      ],
    );
  }

  Widget _buildLocationInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: reservation.locationName,
          appTextTheme: AppTextTheme.font18SimiBoldBlack(),
        ),
        SizedBox(height: 8.h),
        _buildInfoRow(
          icon: AppImages.location3,
          title: "",
          subtitle: reservation.address,
        ),
      ],
    );
  }

  Widget _buildCarInfo() {
    return _buildInfoRow(
      icon: AppImages.car,
      title: 'نيسان بالعطيل، 2023 / ايتود',
      subtitle: null,
    );
  }

  Widget _buildPaymentRow() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColor.greyContainerColor),
          ),
          child: Image.asset(
            AppImages.visaImage,
            width: 22.w,
            height: 20.h,
          ),
        ),
        SizedBox(width: 8.w),
        AppText(
          text: reservation.paymentStatus ?? '',
          appTextTheme: AppTextTheme.bodyMediumTextStyle(),
        ),
        SizedBox(width: 4.w),
        AppText(
          text: '${reservation.price?.toStringAsFixed(0)}',
          appTextTheme: AppTextTheme.font18SimiBoldBlack(),
        ),
        SizedBox(width: 4.w),
        SvgPicture.asset(
          height: 15.h,
          width: 15.w,
          AppImages.realSu,
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required String icon,
    required String title,
    String? subtitle,
  }) {
    return Row(
      children: [
        CustomImageWidget(
          imageUrl: icon,
          width: 20.w,
          height: 20.w,
          color: AppColor.primaryColor,
          isFlag: true,
        ),
        SizedBox(width: 12.w),
        AppText(
          text: title,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        if (subtitle != null) ...[
          SizedBox(height: 4.h),
          AppText(
            text: subtitle,
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              fontSize: 12.sp,
              color: AppColor.greyColor,
            ),
          ),
        ],
      ],
    );
  }
}