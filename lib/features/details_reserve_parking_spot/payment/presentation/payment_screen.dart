import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import '../domain/payment_model.dart';
import 'controller/payment_controller.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  final double total = 30;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentMethodsProvider);
    final controller = ref.read(paymentMethodsProvider.notifier);

    void goToBookingSummary() {
      final PaymentMethodModel? selected = controller.selectedMethod;
      if (selected == null) return;

      NavigationService.push(
        '/bookingSummary',
        context: context,
        extra: {
          'paymentMethodId': selected.id,
          'paymentMethod': selected,
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          leading: SquareButton(
            onTap: () => Navigator.pop(context),
            icon: Image.asset(
              AppImages.arrowRightIcon,
              width: 20.w,
              height: 20.w,
              color: AppColor.primaryColor,
            ),
          ),
          trailing: CloseButtonCircle(
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
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
                children: state.methods.map((m) {
                  final selected = state.selectedId == m.id;

                  return PaymentMethodCard(
                    method: m,
                    isSelected: selected,
                    onTap: () {
                      controller.select(m.id);
                      goToBookingSummary();
                    },
                  );
                }).toList(),
              ),
              const Spacer(),
              TotalBar(total: total),
              SizedBox(height: 12.h),
              CustomButtonWidget(
                text: 'التالي',
                onPressed: goToBookingSummary,
                iconOnRight: false,
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16.w,
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
