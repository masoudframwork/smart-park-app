import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';

class MintSquareBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const MintSquareBtn({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: AppColor.containerSecondaryColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        alignment: Alignment.center,
        child: AppText(
          text: label,
          appTextTheme: AppTextTheme.timeTextStyle(),
        ),
      ),
    );
  }
}

class TimeBox extends StatelessWidget {
  final TimeOfDay time;
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final bool enabled;

  const TimeBox({
    super.key,
    required this.time,
    required this.onPlus,
    required this.onMinus,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final parts = _formatTimeParts(time);

    return Container(
      width: 154.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: AppColor.greyBorderColor,
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        spacing: 4.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // زر -
          MintSquareBtn(
            label: '−',
            onTap: enabled ? onMinus : null,
          ),

          SizedBox(
            width: 70.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  text: parts.hhmm,
                  appTextTheme:
                      AppTextTheme.timeTextStyle().copyWith(fontSize: 16),
                ),
                SizedBox(width: 4.w),
                AppText(
                  text: parts.period,
                  appTextTheme:
                      AppTextTheme.timeTextStyle().copyWith(fontSize: 16),
                ),
              ],
            ),
          ),

          // زر +
          MintSquareBtn(
            label: '+',
            onTap: enabled ? onPlus : null,
          ),
        ],
      ),
    );
  }

  _TimeParts _formatTimeParts(TimeOfDay t) {
    final hour12 = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final hh = hour12.toString().padLeft(2, '0');
    final mm = t.minute.toString().padLeft(2, '0');
    final period = t.period == DayPeriod.am ? 'ص' : 'م';

    return _TimeParts(
      period: period,
      hhmm: '$hh:$mm',
    );
  }
}

class _TimeParts {
  final String period;
  final String hhmm;

  _TimeParts({
    required this.period,
    required this.hhmm,
  });
}

class TimeRangeRow extends StatelessWidget {
  final TimeOfDay start;
  final TimeOfDay end;

  final VoidCallback onStartMinus;
  final VoidCallback onStartPlus;

  final VoidCallback onEndMinus;
  final VoidCallback onEndPlus;

  const TimeRangeRow({
    super.key,
    required this.start,
    required this.end,
    required this.onStartMinus,
    required this.onStartPlus,
    required this.onEndMinus,
    required this.onEndPlus,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimeBox(
            time: start,
            onPlus: onStartPlus,
            onMinus: onStartMinus,
            enabled: true,
          ),

          SizedBox(width: 20.w),

          AppText(
            text: 'إلى',
            appTextTheme: AppTextTheme.titleSmallTextStyle().copyWith(
              color: AppColor.blackNumberSmallColor,
            ),
          ),

          SizedBox(width: 20.w),

          // نهاية الحجز
          TimeBox(
            time: end,
            onPlus: onEndPlus,
            onMinus: onEndMinus,
            enabled: true,
          ),
        ],
      ),
    );
  }
}
