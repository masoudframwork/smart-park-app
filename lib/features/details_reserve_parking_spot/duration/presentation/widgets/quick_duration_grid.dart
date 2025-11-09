import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../controller/duration_controller.dart';

class _DurationOption {
  final String label;
  final double value;
  const _DurationOption(this.label, this.value);
}

class QuickDurationGrid extends ConsumerWidget {
  const QuickDurationGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(durationControllerProvider);
    final controller = ref.read(durationControllerProvider.notifier);

    final items = const <_DurationOption>[
      _DurationOption('30 دقيقة', 0.5),
      _DurationOption('ساعة', 1),
      _DurationOption('ساعتين', 2),
      _DurationOption('3 ساعات', 3),
      _DurationOption('4 ساعات', 4),
      _DurationOption('6 ساعات', 6),
    ];

    return Wrap(
      spacing: 16.w,
      runSpacing: 16.h,
      children: items.map((item) {
        final isSelected = state.hours == item.value;
        return _DurationChip(
          label: item.label,
          selected: isSelected,
          onTap: () => controller.setHours(item.value),
        );
      }).toList(),
    );
  }
}

class _DurationChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _DurationChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 109.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: selected ? AppColor.secondaryColor : AppColor.lightPurpleColor,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: AppColor.lightPurpleColor,
          ),
        ),
        child: Center(
          child: AppText(
            text: label,
            textAlign: TextAlign.center,
            appTextTheme: AppTextTheme.numberSmallTextStyle().copyWith(
              color: AppColor.blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
