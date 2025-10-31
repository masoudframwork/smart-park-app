import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/details_reserve_parking_widget/button_primary_total_bar_widhet/primary_button.dart';
import '../../../payment/presentation/widget/payment_method_card.dart';

class ChangePaymentMethodBottomSheet extends StatelessWidget {
  const ChangePaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
        bottom: 24.h + 16.h, // مساحة للزر الأخضر المثبت تحت
      ),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      constraints: BoxConstraints(
        maxHeight: 0.55.sh,
      ),
      child: Stack(
        children: [
          Column(
            spacing: 20.h,
            children: [
              const _HeaderBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ---------- الصف الأول ----------
                      Row(
                        children: [
                          Expanded(
                            child: PaymentMethodCard(
                              line1: 'البطاقة المنتهية بـ 0000',
                              assetImage: AppImages.pay,
                              isSelected: false,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: PaymentMethodCard(
                              line1: 'البطاقة المنتهية بـ 0000',
                              assetImage: AppImages.visaImage,
                              isSelected: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),

                      // ---------- الصف الثاني ----------
                      Row(
                        children: [
                          Expanded(
                            child: PaymentMethodCard(
                              line1: 'بطاقة جديدة',
                              isAddNew: true,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: PaymentMethodCard(
                              line1: 'الرصيد 2,785 د.ا',
                              isBalance: true,
                              icon: Icons.account_balance_wallet_outlined,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // زر "تحديث" المثبت تحت
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              width: double.infinity,
              height: 52.h,
              child: PrimaryButton(
                text: 'تحديث',
                showDefaultIcon: false,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBar extends StatelessWidget {
  const _HeaderBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // العنوان بالنص
          AppText(
            text: 'تغيير طريقة الدفع',
            appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
              fontWeight: FontWeight.w600,
              color: AppColor.blackColor,
            ),
          ),

          // زر الإغلاق (X) على اليسار
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: AppColor.contanearGreyColor,
                    width: 0.8,
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.close,
                  size: 18.w,
                  color: AppColor.blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
