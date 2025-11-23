import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';

import '../../../../../core/helpers/show_change_vehicle_dialog.dart';
import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.h,
        ),
        CustomButtonWidget(
          onPressed: () {
            showBlurBottomSheet(
              context: context,
              child: TermsAndConditionsBottomSheet(),
            );
            //  NavigationService.push('/bankCardDataPage', context: context);
          },
          text: S.of(context).create_account,
          type: ButtonType.elevated,
          borderRadius: 10.r,
        ),
      ],
    );
  }
}

class TermsAndConditionsBottomSheet extends StatelessWidget {
  const TermsAndConditionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      maxHeightFactor: 0.50,
      title: S.of(context).terms_and_conditions,
      bottomAction: CustomButtonWidget(
        onPressed: () {
          NavigationService.push('/otpSignUpPage', context: context);
          Navigator.pop(context);
        },
        text: S.of(context).Iagreetothetermsandconditions,
        type: ButtonType.elevated,
        borderRadius: 10.r,
      ),
      headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
      body: Material(
        color: AppColor.settingsBackgroundColor,
        child: SizedBox(
          height: 0.3.sh,
         // height: 0.55.sh,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                AppText(
                  text:
                      S.of(context).parkingbookingandpaymentmanagementsystemimprovement,
                  appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
                    color: AppColor.titelButtonColor,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
