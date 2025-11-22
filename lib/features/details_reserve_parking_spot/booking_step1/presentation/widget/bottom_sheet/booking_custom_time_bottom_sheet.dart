// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../../../core/widgets/app_bottom_sheet.dart';
// import '../../../../../../core/widgets/custom_button.dart';
//
// import '../../../../../../core/widgets/details_reserve_parking_widget/time_range_row.dart';
// import '../../../domain/duration_states.dart';
//
// class BookingCustomTimeBottomSheet extends ConsumerStatefulWidget {
//   const BookingCustomTimeBottomSheet({super.key});
//
//   @override
//   ConsumerState<BookingCustomTimeBottomSheet> createState() =>
//       _BookingCustomTimeBottomSheetState();
// }
//
// class _BookingCustomTimeBottomSheetState
//     extends ConsumerState<BookingCustomTimeBottomSheet> {
//   late TimeOfDay _tmpStart;
//   late TimeOfDay _tmpEnd;
//
//   @override
//   void initState() {
//     super.initState();
//     final state = ref.read(durationControllerProvider);
//     _tmpStart = state.start;
//     _tmpEnd = state.end;
//   }
//
//   TimeOfDay _addMinutes(TimeOfDay t, int minutes) {
//     final base = DateTime(2000, 1, 1, t.hour, t.minute);
//     final res = base.add(Duration(minutes: minutes));
//     return TimeOfDay(hour: res.hour, minute: res.minute);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: AppBottomSheet(
//         maxHeightFactor: 0.33,
//         title: 'تحديد مدة الحجز',
//         headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 TimeRangeRow(
//                   start: _tmpStart,
//                   end: _tmpEnd,
//                   onStartMinus: () =>
//                       setState(() => _tmpStart = _addMinutes(_tmpStart, -15)),
//                   onStartPlus: () =>
//                       setState(() => _tmpStart = _addMinutes(_tmpStart, 15)),
//                   onEndMinus: () =>
//                       setState(() => _tmpEnd = _addMinutes(_tmpEnd, -15)),
//                   onEndPlus: () =>
//                       setState(() => _tmpEnd = _addMinutes(_tmpEnd, 15)),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         bottomAction: CustomButtonWidget(
//           text: 'موافق',
//           onPressed: () {
//             ref
//                 .read(durationControllerProvider.notifier)
//                 .setCustomRange(_tmpStart, _tmpEnd);
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
import '../../../domain/duration_states.dart';
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
class BookingCustomTimeBottomSheet extends ConsumerWidget {
  const BookingCustomTimeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(durationControllerProvider);

    final totalMinutes = (state.hours * 60).round();
    final initialHours = totalMinutes ~/ 60;
    final initialMinutes = totalMinutes % 60;

    final hoursController = TextEditingController(
      text: initialHours.toString().padLeft(2, '0'),
    );
    final minutesController = TextEditingController(
      text: initialMinutes.toString().padLeft(2, '0'),
    );

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
          title: 'تحديد مدة الحجز',
          headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _TimePartField(
                    label: 'ساعة',
                    controller: hoursController,
                  ),
                  SizedBox(width: 16.w),
                  _TimePartField(
                    label: 'دقيقة',
                    controller: minutesController,
                  ),
                ],
              ),
            ],
          ),
          bottomAction: CustomButtonWidget(
            text: 'موافق',
            onPressed: () {
              final hoursText = hoursController.text.trim();
              final minutesText = minutesController.text.trim();

              final intHours =
                  int.tryParse(hoursText.isEmpty ? '0' : hoursText) ?? 0;
              int intMinutes =
                  int.tryParse(minutesText.isEmpty ? '0' : minutesText) ?? 0;

              if (intMinutes > 59) intMinutes = 59;
              if (intMinutes < 0) intMinutes = 0;

              final totalMinutes = intHours * 60 + intMinutes;

              if (totalMinutes > 0) {
                final hoursDouble = totalMinutes / 60.0;
                ref
                    .read(durationControllerProvider.notifier)
                    .setHours(hoursDouble);
              }

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

  const _TimePartField({
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: label,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller,
          width: 147.w,
          hintText: '00',
          textAlign: TextAlign.center,
          textInputType: TextInputType.number,

          borderSideColor: AppColor.greyDividerColor,
          borderRadius: 10.r,
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
      ],
    );
  }
}
