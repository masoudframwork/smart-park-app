import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../generated/l10n.dart';
import '../controller/onboarding_prefs_providers.dart';

class HideTipsSwitch extends ConsumerWidget {
  const HideTipsSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(hideTipsProvider);
    final ctrl = ref.read(hideTipsProvider.notifier);

    return Row(
      spacing: 10.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: value,
          onChanged: ctrl.set,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          trackColor: WidgetStateProperty.resolveWith((states) {
            final isOn = states.contains(WidgetState.selected);
            return isOn
                ? AppColor.yellowContainerColor
                : AppColor.greyContainerColor;
          }),
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          trackOutlineWidth: WidgetStateProperty.all(0),
          thumbColor: WidgetStateProperty.all(AppColor.whiteColor),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        AppText(
          text: S.of(context).doNotDisplayInstructionsAgain,
          appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
