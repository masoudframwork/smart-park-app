import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/routing/app_route.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';

import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/widgets/custom_button.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 150.h,
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            spacing: 10.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                  text: 'الربط مع نفاذ',
                  appTextTheme: AppTextTheme.descriptionTextStyle().copyWith(
                    color: AppColor.primaryColor,
                  )),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColor.primaryColor,
              ),
            ],
          ),
        ),
        CustomButtonWidget(
          onPressed: () {
            NavigationService.push('/bankCardDataPage', context: context);
          },
          text: 'التالي',
          type: ButtonType.elevated,
          borderRadius: 10.r,
          icon: Icon(
            Icons.arrow_forward_ios_sharp,
            color: AppColor.whiteColor,
          ),
          iconOnRight: false,
          iconLayout: ButtonIconLayout.separate,
        ),
      ],
    );
  }
}
