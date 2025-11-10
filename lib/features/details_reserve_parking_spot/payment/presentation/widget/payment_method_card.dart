
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/theme/app_text_theme.dart';

import '../../domain/payment_model.dart';

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethodModel method;
  final bool isSelected;
  final double cardWidth;
  final double cardHeight;
  final VoidCallback? onTap;

  const PaymentMethodCard({
    super.key,
    required this.method,
    required this.isSelected,
    this.cardWidth = 172,
    this.cardHeight = 110,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = isSelected
        ? AppColor.secondaryColor
        : AppColor.greysCardColor;

    final Color borderColor = isSelected
        ? AppColor.secondaryColor
        : AppColor.contanearGreyColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6.r),
        child: Ink(
          width: cardWidth.w,
          height: cardHeight.h,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: borderColor, width: 1),
          ),
          padding: EdgeInsets.all(12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              SizedBox(height: 12.h),
              AppText(
                text: method.line1,
                textAlign: TextAlign.center,
                appTextTheme:
                AppTextTheme.bodySmallTextStyle().copyWith(
                  color: AppColor.blackColor,
                  decoration: TextDecoration.none,
                ),
              ),
              if (method.line2 != null &&
                  method.line2!.trim().isNotEmpty) ...[
                SizedBox(height: 4.h),
                AppText(
                  text: method.line2!,
                  textAlign: TextAlign.center,
                  appTextTheme:
                  AppTextTheme.bodySmallTextStyle().copyWith(
                    color: AppColor.blackNumberSmallColor,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    final String? path = method.assetImage;
    final Color? color = method.assetColor;
    Widget content;

    if (path != null && path.isNotEmpty) {
      final isSvg = path.toLowerCase().endsWith('.svg');
      content = isSvg
          ? SvgPicture.asset(
        path,
        width: method.logoMaxW.w,
        height: method.logoMaxH.h,
        fit: BoxFit.contain,
        color: color,
      )
          : Image.asset(
        path,
        width: method.logoMaxW.w,
        height: method.logoMaxH.h,
        fit: BoxFit.contain,
        color: color,
        colorBlendMode:
        color != null ? BlendMode.srcIn : null,
      );
    } else {
      content = Icon(
        method.icon ?? Icons.payment,
        size: 24.w,
        color: color ?? AppColor.primaryColor,
      );
    }

    if (method.hasLogoBorder) {
      return Container(
        width: method.logoMaxW.w,
        height: method.logoMaxH.h,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: AppColor.contanearGreyColor,
            width: 1,
          ),
        ),
        padding: EdgeInsets.all(4.w),
        alignment: Alignment.center,
        child: content,
      );
    }

    return SizedBox(
      width: method.logoMaxW.w,
      height: method.logoMaxH.h,
      child: Center(child: content),
    );
  }
}

