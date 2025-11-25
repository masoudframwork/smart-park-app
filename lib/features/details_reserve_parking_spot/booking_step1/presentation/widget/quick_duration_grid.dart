// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../../core/theme/app_color.dart';
// import '../../../../../core/theme/app_text_theme.dart';
// import '../../../../../core/widgets/app_text.dart';
// import '../../../duration/presentation/controller/duration_controller.dart';
//
// class _DurationOption {
//   final String label;
//   final double value;
//   const _DurationOption(this.label, this.value);
// }
//
// class QuickDurationGrid extends ConsumerWidget {
//   const QuickDurationGrid({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(durationControllerProvider);
//     final controller = ref.read(durationControllerProvider.notifier);
//
//     final items = const <_DurationOption>[
//       _DurationOption('30 دقيقة', 0.5),
//       _DurationOption('ساعة', 1),
//       _DurationOption('ساعتين', 2),
//       _DurationOption('3 ساعات', 3),
//       _DurationOption('4 ساعات', 4),
//       _DurationOption('6 ساعات', 6),
//     ];
//
//     return Wrap(
//       spacing: 16.w,
//       runSpacing: 16.h,
//       children: items.map((item) {
//         final isSelected = state.hours == item.value;
//         return _DurationChip(
//           label: item.label,
//           selected: isSelected,
//           onTap: () => controller.setHours(item.value),
//         );
//       }).toList(),
//     );
//   }
// }
//
// class _DurationChip extends StatelessWidget {
//   final String label;
//   final bool selected;
//   final VoidCallback onTap;
//
//   const _DurationChip({
//     required this.label,
//     required this.selected,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 109.w,
//         height: 40.h,
//         decoration: BoxDecoration(
//           color: selected ? AppColor.secondaryColor : AppColor.lightPurpleColor,
//           borderRadius: BorderRadius.circular(4.r),
//           border: Border.all(
//             color: AppColor.whiteColor,
//           ),
//         ),
//         child: Center(
//           child: AppText(
//             text: label,
//             textAlign: TextAlign.center,
//             appTextTheme: AppTextTheme.numberSmallTextStyle().copyWith(
//               color: AppColor.blackColor,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/l10n.dart';
import '../controller/duration_controller.dart';

class QuickDurationGrid extends ConsumerWidget {
  final String? selectedId;
  final void Function(String id, double hours) onSelect;

  const QuickDurationGrid({
    super.key,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final durationState = ref.watch(durationControllerProvider);

    // دالة تنسيق المدة (استخدم الترجمة)
    String formatDurationLabel(BuildContext context, double hours) {
      final t = S.of(context);

      // أقل من ساعة → دقائق
      if (hours < 1) {
        final minutes = (hours * 60).round();

        if (minutes == 1) return "1 ${t.minute}";
        if (minutes == 2) return "2 ${t.minute}";
        if (minutes > 2) return "$minutes ${t.minute}";
      }

      final intHours = hours.floor();
      final remainingMinutes = ((hours - intHours) * 60).round();

      // فقط ساعات بدون دقائق
      if (remainingMinutes == 0) {
        if (intHours == 1) return t.hour;       // ساعة
        if (intHours == 2) return t.hour2;      // ساعتين
        if (intHours >= 3) {
          // لو عندك key خاص للجمع مثل "3 ساعات" مع {}
          // مثال: "hours3plus": "{} ساعات"
          // return t.hours3plus.replaceFirst("{}", intHours.toString());

          // أو مؤقتاً استخدمي نفس hour3 لو هي نص ثابت:
          return '$intHours ${t.hours}';
        }
      }

      // ساعات + دقائق
      final hoursText = (intHours == 1)
          ? t.hour
          : (intHours == 2)
          ? t.hour2
          : '$intHours ${t.hours}';

      final minutesText = (remainingMinutes == 1)
          ? "1 ${t.minute}"
          : "$remainingMinutes ${t.minute}";

      return "$hoursText ${t.and} $minutesText";
    }

    final baseOptions = <_DurationOption>[
      _DurationOption(id: '30m', hours: 0.5, label: S.of(context).minute30),
      _DurationOption(id: '1h', hours: 1, label: S.of(context).hours),
      _DurationOption(id: '2h', hours: 2, label: S.of(context).hour2),
      _DurationOption(id: '3h', hours: 3, label: S.of(context).hour3),
      _DurationOption(id: '4h', hours: 4, label: S.of(context).hour4),
      _DurationOption(id: '6h', hours: 6, label: S.of(context).hour6),
    ];

    final options = [...baseOptions];

    final bool hasPreset = baseOptions.any(
          (o) => o.hours == durationState.hours,
    );

    if (!hasPreset && durationState.hours > 0) {
      options.add(
        _DurationOption(
          id: 'custom',
          hours: durationState.hours,
          // ✅ هنا كانت المشكلة: لازم نمرر context
          label: formatDurationLabel(context, durationState.hours),
          isCustom: true,
        ),
      );
    }

    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: options.map((option) {
        final bool isSelected = durationState.hours == option.hours;

        return GestureDetector(
          onTap: () => onSelect(option.id, option.hours),
          child: Container(
            width: 100.w,
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppColor.primaryColor : AppColor.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isSelected
                    ? AppColor.primaryColor
                    : AppColor.greyDividerColor,
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: AppText(
              text: option.label,
              appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
                color:
                isSelected ? AppColor.whiteColor : AppColor.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _DurationOption {
  final String id;
  final double hours;
  final String label;
  final bool isCustom;

  _DurationOption({
    required this.id,
    required this.hours,
    required this.label,
    this.isCustom = false,
  });
}



// String formatDurationLabel(double hours) {
//
//   if (hours < 1) {
//     final minutes = (hours * 60).round();
//     return '$minutes دقيقة';
//   }
//
//   final intHours = hours.floor();
//   final remainingMinutes = ((hours - intHours) * 60).round();
//
//   if (remainingMinutes == 0) {
//     if (intHours == 1) return 'ساعة';
//     if (intHours == 2) return 'ساعتين';
//     return '$intHours ساعات';
//   }
//
//   final hoursText = intHours == 1
//       ? 'ساعة'
//       : intHours == 2
//       ? 'ساعتين'
//       : '$intHours ساعات';
//
//   return '$hoursText و $remainingMinutes دقيقة';
// }