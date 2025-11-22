import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';

import '../../../../../core/helpers/show_change_vehicle_dialog.dart';
import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../../core/widgets/custom_button.dart';

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
          text: 'إنشاء الحساب',
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
      title: 'الشروط و الأحكام',
      bottomAction: CustomButtonWidget(
        onPressed: () {
          NavigationService.push('/otpSignUpPage', context: context);
          Navigator.pop(context);
        },
        text: 'موافق على الشروط و الأحكام',
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
                      'إدارة عمليات الحجز والدفع للمواقف تحسين تجربة المستخدم وتطوير الخدمات التواصل معكم في حال وجود استفسارات أو إشعارات مهمة أغراض التحليل والإحصاء لتحسين أداء التطبيق ضمان الامتثال لقوانين المحلية وتعليمات الجهات المختصة إدارة عمليات الحجز والدفع للمواقف تحسين تجربة المستخدم وتطوير الخدمات التواصل معكم في حال وجود استفسارات أو إشعارات مهمة أغراض التحليل والإحصاء لتحسين أداء التطبيق ضمان الامتثال لقوانين المحلية وتعليمات الجهات المختصة إدارة عمليات الحجز والدفع للمواقف تحسين تجربة المستخدم وتطوير الخدمات التواصل معكم في حال وجود استفسارات أو إشعارات مهمة أغراض التحليل والإحصاء لتحسين أداء التطبيق ضمان الامتثال لقوانين المحلية وتعليمات الجهات المختصة إدارة عمليات الحجز والدفع للمواقف تحسين تجربة المستخدم وتطوير الخدمات التواصل معكم في حال وجود استفسارات أو إشعارات مهمة أغراض التحليل والإحصاء لتحسين أداء التطبيق ضمان الامتثال لقوانين المحلية وتعليمات الجهات المختصة',
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
