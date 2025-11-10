import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../payment/domain/payment_model.dart';
import '../../../payment/presentation/widget/payment_method_card.dart';
import '../../domain/payment_provider.dart';

class ChangePaymentMethodBottomSheet extends ConsumerWidget {
  ChangePaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBottomSheet(
      title: 'تغيير طريقة الدفع',
      headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
      body: Column(
        children: [
          _buildRow(context, ref, [paymentMethods[0], paymentMethods[1]]),
          SizedBox(height: 12.h),
          _buildRow(context, ref, [paymentMethods[2], paymentMethods[3]]),
          SizedBox(height: 30.h),
          CustomButtonWidget(
            text: 'تحديث',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, WidgetRef ref,
      List<PaymentMethodModel> rowMethods) {
    final selected = ref.watch(selectedPaymentMethodProvider);
    final controller = ref.read(selectedPaymentMethodProvider.notifier);

    return Row(
      children: rowMethods.map((method) {
        return Expanded(
          child: Padding(
            padding:
                EdgeInsets.only(right: method == rowMethods.last ? 12 : 12.w),
            child: PaymentMethodCard(
              method: method,
              isSelected: selected?.id == method.id,
              onTap: () => controller.select(method),
            ),
          ),
        );
      }).toList(),
    );
  }

  final List<PaymentMethodModel> paymentMethods = [
    PaymentMethodModel(
      id: 'stc_pay',
      line1: 'البطاقة المنتهية بـ 0000',
      assetImage: AppImages.pay,

    ),
    PaymentMethodModel(
      id: 'visa',
      line1: 'البطاقة المنتهية بـ 0000',
      assetImage: AppImages.visaImage,


    ),
    PaymentMethodModel(
      id: 'add_new',
      line1: 'بطاقة جديدة',
      assetImage: AppImages.add,
      logoMaxW: 32,
      logoMaxH: 35,
    ),
    PaymentMethodModel(
      id: 'wallet',
      line1: 'الرصيد 2,785 د.ا',
      assetImage: AppImages.account,
      assetColor: AppColor.primaryColor,
      logoMaxW: 32,
      logoMaxH: 35,
    ),
  ];
}
