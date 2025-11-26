// class BookingCustomTimeBottomSheet extends ConsumerWidget {
//   const BookingCustomTimeBottomSheet({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(durationControllerProvider);
//
//     final totalMinutes = (state.hours * 60).round();
//     final initialHours = totalMinutes ~/ 60;
//     final initialMinutes = totalMinutes % 60;
//
//     final hoursController = TextEditingController(
//       text: initialHours.toString().padLeft(2, '0'),
//     );
//     final minutesController = TextEditingController(
//       text: initialMinutes.toString().padLeft(2, '0'),
//     );
//
//     return Material(
//       color: Colors.transparent,
//       child: AppBottomSheet(
//         maxHeightFactor: 0.33,
//         title: 'تحديد مدة الحجز',
//         headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 8.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _TimePartField(
//                   label: 'ساعة',
//                   controller: hoursController,
//                 ),
//                 SizedBox(width: 16.w),
//                 _TimePartField(
//                   label: 'دقيقة',
//                   controller: minutesController,
//                 ),
//               ],
//             ),
//           ],
//         ),
//         bottomAction: CustomButtonWidget(
//           text: 'موافق',
//           onPressed: () {
//             final hoursText = hoursController.text.trim();
//             final minutesText = minutesController.text.trim();
//
//             final intHours =
//                 int.tryParse(hoursText.isEmpty ? '0' : hoursText) ?? 0;
//             int intMinutes =
//                 int.tryParse(minutesText.isEmpty ? '0' : minutesText) ?? 0;
//
//             if (intMinutes > 59) intMinutes = 59;
//             if (intMinutes < 0) intMinutes = 0;
//
//             final totalMinutes = intHours * 60 + intMinutes;
//
//             if (totalMinutes > 0) {
//               final hoursDouble = totalMinutes / 60.0;
//               ref
//                   .read(durationControllerProvider.notifier)
//                   .setHours(hoursDouble);
//             }
//
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custome_text_field_widget.dart';
import '../../../../../../generated/l10n.dart';
import '../../../domain/duration_controller.dart';
import '../../controller/duration_controller.dart';

class BookingCustomTimeBottomSheet extends ConsumerWidget {
  const BookingCustomTimeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(customTimeFormProvider);
    final formController = ref.read(customTimeFormProvider.notifier);

    final hoursController = TextEditingController(text: formState.hoursText);
    final minutesController =
        TextEditingController(text: formState.minutesText);

    final bool is24Hours = formState.is24Hours;

    return Material(
      color: Colors.transparent,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AppBottomSheet(
          maxHeightFactor: 0.33,
          title: S.of(context).specifythebookingduration,
          headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _TimePartField(
                    label: S.of(context).hours,
                    controller: hoursController,
                    enabled: true,
                    onChanged: formController.setHours,
                  ),
                  SizedBox(width: 16.w),
                  _TimePartField(
                    label: S.of(context).minute,
                    controller: minutesController,
                    enabled: !is24Hours,
                    onChanged: formController.setMinutes,
                  ),
                ],
              ),
            ],
          ),
          bottomAction: CustomButtonWidget(
            text: S.of(context).accept,
            onPressed: () {
              int hours = formState.intHours;
              int minutes = formState.intMinutes;

              const int maxMinutes = 24 * 60;
              int totalMinutes = hours * 60 + minutes;

              if (totalMinutes > maxMinutes) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      //المدة لا يمكن أن تتجاوز 24 ساعة
                      '',
                    ),
                  ),
                );
                return;
              }

              if (hours >= 24) {
                hours = 24;
                minutes = 0;
                totalMinutes = maxMinutes;
              }

              if (totalMinutes <= 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      // 'يرجى إدخال مدة أكبر من صفر.',
                      '',
                    ),
                  ),
                );
                return;
              }

              final hoursDouble = totalMinutes / 60.0;

              ref
                  .read(durationControllerProvider.notifier)
                  .setHours(hoursDouble);

              formController.reset();

              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}

class _TimePartField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool enabled;
  final ValueChanged<String> onChanged;

  const _TimePartField({
    required this.label,
    required this.controller,
    this.enabled = true,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Opacity(
        opacity: enabled ? 1 : 0.4,
        child: IgnorePointer(
          ignoring: !enabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: label,
                appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 17.h),
              CustomTextFormField(
                controller: controller,
                width: 147,
                hintText: '00',
                textAlign: TextAlign.center,
                textInputType: TextInputType.number,
                borderSideColor: AppColor.greyDividerColor,
                borderRadius: 10.r,
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
