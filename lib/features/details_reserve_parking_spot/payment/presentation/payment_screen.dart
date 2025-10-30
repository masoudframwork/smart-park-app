import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/features/details_reserve_parking_spot/payment/presentation/widget/payment_method_card.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/theme/app_color.dart';

import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/button_primary_total_bar_widhet/primary_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/button_primary_total_bar_widhet/total_bar.dart';
import '../../../../core/widgets/details_reserve_parking_widget/steps_header.dart';
import '../../the_vehicle/persentation/widgets/app_bar.dart';
import '../../the_vehicle/persentation/widgets/section_title.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  final double total = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const StepsHeader(active: 3),
              SizedBox(height: 50.h),
              const SectionTitle(
                icon: Icons.payment_outlined,
                title: 'اختر طريقة الدفع',
              ),
              SizedBox(height: 20.h),
              Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: [
                  PaymentMethodCard(
                    line1: 'البطاقة المنتهية بـ 0000',
                    assetImage: AppImages.visa,
                    isSelected: true,
                  ),
                  PaymentMethodCard(
                    line1: 'البطاقة المنتهية بـ 0000',
                    line2: null,
                    assetImage: AppImages.pay,
                    isSelected: false,
                  ),
                  PaymentMethodCard(
                    line1: 'الرصيد 2,785 د.ا',
                    isBalance: true,
                    icon: Icons.account_balance_wallet_outlined,
                  ),
                  PaymentMethodCard(
                    line1: 'بطاقة جديدة',
                    isAddNew: true,
                  ),
                ],
              ),
              SizedBox(height: 150.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TotalBar(total: total),
                  SizedBox(height: 12.h),
                  PrimaryButton(
                    showDefaultIcon: true,
                    text: 'التالي',
                    onPressed: () {
                      NavigationService.push(
                        '/bookingSummary',
                        context: context,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
