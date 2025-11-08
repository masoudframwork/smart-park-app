import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/details_reserve_parking_spot/payment/presentation/widget/payment_method_card.dart';

import '../../../../core/constants/image_string.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/theme/app_color.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/container_total_bar/total_bar.dart';
import '../../../../core/widgets/details_reserve_parking_widget/steps_header.dart';
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
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const StepsHeader(active: 3),
                      SizedBox(height: 24.h),
                      SectionTitle(
                        leading: Image.asset(
                          AppImages.card,
                          width: 26.w,
                          height: 21.h,
                        ),
                        title: 'اختر طريقة الدفع',
                      ),
                      SizedBox(height: 16.h),
                      Wrap(
                        spacing: 12.w,
                        runSpacing: 12.h,
                        children: [
                          GestureDetector(
                            onTap: () {
                              NavigationService.push(
                                '/bookingSummary',
                                context: context,
                              );
                            },
                            child: PaymentMethodCard(
                              line1: 'البطاقة المنتهية بـ 0000',
                              assetImage: AppImages.visaImage,
                              isSelected: true,
                            ),
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
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TotalBar(total: total),
                  SizedBox(height: 12.h),
                  CustomButtonWidget(
                    text: 'التالي',
                    onPressed: () {
                      NavigationService.push(
                        '/bookingSummary',
                        context: context,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16.w,
                      color: AppColor.whiteColor,
                    ),
                    iconOnRight: false,
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
