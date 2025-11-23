import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/core/widgets/app_text.dart';
import '../../../../../core/constants/image_string.dart';
import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_result_dialog.dart';
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
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment:
                  isRtl ? Alignment.centerRight : Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      NavigationService.pop();
                    },
                    child: Container(
                      width: 34.w,
                      height: 34.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColor.contanearGreyColor,
                          width: 1,
                        ),
                      ),
                      child: SvgPicture.asset(
                        isRtl ? AppImages.arrowIcon2 : AppImages.arrowIcon,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ),
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
                  text: S.of(context).pleaselogintoNafathappandselectthefollowingnumber,
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
                  text: 'سيتم التحديث خلال $minutesStr:$secondsStr ثانية',
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
                      barrierDismissible: false,
                      builder: (_) => AppResultDialog(
                        message: S.of(context).youraccountisnowconnectedwithNafath,
                        buttonText: S.of(context).continu_e,
                        onButtonPressed: () {
                          NavigationService.push(
                            '/bankCardDataPage',
                            context: context,
                          );
                        },
                        headerWidget: SvgPicture.asset(
                          AppImages.trueChek,
                          width: 47.w,
                          height: 47.w,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
