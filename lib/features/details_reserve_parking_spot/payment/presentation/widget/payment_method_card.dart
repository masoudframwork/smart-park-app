import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class PaymentMethodCard extends StatelessWidget {
  final bool isSelected;
  final bool isAddNew;
  final String? assetImage;
  final IconData? icon;

  final String line1;
  final String? line2;

  final double cardWidth;
  final double cardHeight;

  final double logoMaxW;
  final double logoMaxH;
  final Color? assetColor;

  final VoidCallback? onTap;

  const PaymentMethodCard({
    super.key,
    required this.line1,
    this.line2,
    this.assetImage,
    this.icon,
    this.isSelected = false,
    this.isAddNew = false,
    this.cardWidth = 172,
    this.cardHeight = 110,
    this.logoMaxW = 70,
    this.logoMaxH = 48,
    this.assetColor,
    this.onTap,
  });

  bool get _isVisaLogo {
    final p = (assetImage ?? '').toLowerCase();
    return p.contains('visa');
  }

  bool get _isWalletLike {
    final name = (assetImage ?? '').toLowerCase();
    final title = line1.trim();
    return title == 'رصيد' ||
        name.contains('wallet') ||
        name.contains('balance');
  }

  bool get _needsLogoBorder => _isVisaLogo;

  @override
  Widget build(BuildContext context) {
    final Color bg =
        isSelected ? AppColor.secondaryColor : AppColor.greysCardColor;
    final Color border =
        isSelected ? AppColor.secondaryColor : AppColor.contanearGreyColor;

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
            border: Border.all(color: border, width: 1),
          ),
          padding: EdgeInsets.all(12.w),
          child: Stack(
            children: [
              Positioned.fill(child: _buildContentFixedHeight()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentFixedHeight() {
    if (isAddNew) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.primaryColor, width: 2),
            ),
            alignment: Alignment.center,
            child: Icon(Icons.add, size: 19.w, color: AppColor.primaryColor),
          ),
          SizedBox(height: 12.h),
          AppText(
            text: 'بطاقة جديدة',
            textAlign: TextAlign.center,
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: AppColor.blackColor,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _needsLogoBorder
            ? Container(
                width: logoMaxW.w,
                height: logoMaxH.h,
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
                child: _buildLogoBoxContent(),
              )
            : SizedBox(
                width: logoMaxW.w,
                height: logoMaxH.h,
                child: Center(child: _buildLogoBoxContent()),
              ),
        SizedBox(
          height: 12.h,
        ),
        AppText(
          text: line1,
          textAlign: TextAlign.center,
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            color: AppColor.blackColor,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (line2 != null && line2!.isNotEmpty) ...[
          SizedBox(height: 4.h),
          AppText(
            text: line2!,
            textAlign: TextAlign.center,
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: AppColor.blackNumberSmallColor,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildLogoBoxContent() {
    final Color? desiredColor =
        _isWalletLike ? AppColor.primaryColor : assetColor;

    if (assetImage != null && assetImage!.isNotEmpty) {
      final isSvg = assetImage!.toLowerCase().endsWith('.svg');
      if (isSvg) {
        return SvgPicture.asset(
          assetImage!,
          width: logoMaxW.w,
          height: logoMaxH.h,
          fit: BoxFit.contain,
          color: desiredColor,
        );
      } else {
        return Image.asset(
          assetImage!,
          width: logoMaxW.w,
          height: logoMaxH.h,
          fit: BoxFit.contain,
          color: desiredColor,
          colorBlendMode: desiredColor != null ? BlendMode.srcIn : null,
        );
      }
    }

    // fallback icon
    return Icon(
      icon ?? Icons.payment,
      size: 24.w,
      color: desiredColor ?? AppColor.primaryColor,
    );
  }
}
