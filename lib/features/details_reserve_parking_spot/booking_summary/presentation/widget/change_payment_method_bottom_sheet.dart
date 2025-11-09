import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../payment/presentation/widget/payment_method_card.dart';

class ChangePaymentMethodBottomSheet extends StatelessWidget {
  const ChangePaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: 'تغيير طريقة الدفع',
      headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
      body: Column(
        children: [
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
                  //isBalance: true,
                  icon: Icons.account_balance_wallet_outlined,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          CustomButtonWidget(
            text: 'تحديث',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
