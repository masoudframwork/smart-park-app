import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/core/widgets/app_text.dart';
import '../../../../../core/constants/image_string.dart';
import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_result_dialog.dart';
import '../../../../../core/widgets/arrow_widget_custom_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_image_widget.dart';

import '../../../../../generated/l10n.dart';
import '../controller/nafath_timer_controller.dart';

class NafathOtpScreen extends ConsumerWidget {
  const NafathOtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainingSeconds = ref.watch(nafathTimerProvider);

    final minutesStr = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (remainingSeconds % 60).toString().padLeft(2, '0');
    final timeStr = '$minutesStr:$secondsStr';

    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ArrowWidgetCustomBar(onTap: () {
                NavigationService.pop();
              }),
              Center(
                child: ClipOval(
                  child: CustomImageWidget(
                    isFlag: true,
                    imageUrl: AppImages.appLogo,
                    width: 147.w,
                    height: 147.w,
                  ),
                ),
              ),
              AppText(
                text: S.of(context).verifythroughNafathapp,
                appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppText(
                text: S
                    .of(context)
                    .pleaselogintoNafathappandselectthefollowingnumber,
                appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              AppText(
                text: '85',
                appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
                  fontSize: 100,
                  fontWeight: FontWeight.w700,
                ),
              ),
              AppText(
                text: remainingSeconds > 0
                    ? '${S.of(context).willrefreshin} $timeStr ${S.of(context).secon}'
                    : S.of(context).youcanrequestanewcodenow,
                textAlign: TextAlign.center,
                appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30.h),
              CustomButtonWidget(
                text: S.of(context).openNafathApp,
                borderRadius: 10.r,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AppResultDialog(
                      message:
                          S.of(context).youraccountisnowconnectedwithNafath,
                      // subMessage: S.of(context).help_support_title,
                      mainButtonText: S.of(context).continu_e,
                      onMainPressed: () {
                        NavigationService.push(RoutePaths.bankCardDataPage);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
