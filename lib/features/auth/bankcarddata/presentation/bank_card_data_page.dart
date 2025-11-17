import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/features/auth/bankcarddata/presentation/widget/back_and_text_widget.dart';
import 'package:smart/features/auth/bankcarddata/presentation/widget/data_card_feild.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_button.dart';

class BankCardDataPage extends StatelessWidget {
  const BankCardDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double bigSpace = 50.h;
    final double smallSpace = 12.h;

    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: bigSpace),
              const BackAndTextWidget(),
              SizedBox(height: bigSpace),
              const DataCardFeild(),
              SizedBox(height: bigSpace),
              Spacer(),
              CustomButtonWidget(
                onPressed: () {},
                text: 'حفظ البطاقة',
                type: ButtonType.elevated,
                borderRadius: 10.r,
              ),
              SizedBox(height: smallSpace),
              CustomButtonWidget(
                onPressed: () {
                  NavigationService.push(
                    RoutePaths.bottomNavBar,
                    context: context,
                  );
                },
                text: ' لاحقاً',
                textStyle: AppTextTheme.titleMediumTextStyle().copyWith(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                type: ButtonType.outlined,
                borderRadius: 10.r,
                backgroundColor: AppColor.whiteBackgroundColor,
                borderColor: AppColor.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
