import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class StepsHeader extends StatelessWidget {
  final int active;
  final List<String> labels;

  const StepsHeader({
    super.key,
    required this.active,
    this.labels = const ['المدة', 'المركبة', 'الدفع'],
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _StepCircle(
                number: '1',
                state: _circleStateFor(1),
              ),
              _StepLine(isPassed: active > 1),
              _StepCircle(
                number: '2',
                state: _circleStateFor(2),
              ),
              _StepLine(isPassed: active > 2),
              _StepCircle(
                number: '3',
                state: _circleStateFor(3),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StepLabel(
                text: labels[0],
                stepNumber: 1,
                activeStep: active,
              ),
              _StepLabel(
                text: labels[1],
                stepNumber: 2,
                activeStep: active,
              ),
              _StepLabel(
                text: labels[2],
                stepNumber: 3,
                activeStep: active,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _StepCircleState _circleStateFor(int stepNumber) {
    if (active > stepNumber) {
      return _StepCircleState.done;
    } else if (active == stepNumber) {
      return _StepCircleState.active;
    } else {
      return _StepCircleState.upcoming;
    }
  }
}

class _StepLine extends StatelessWidget {
  final bool isPassed;

  const _StepLine({required this.isPassed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: isPassed ? AppColor.primaryColor : AppColor.greyDividerColor,
      ),
    );
  }
}

enum _StepCircleState { done, active, upcoming }

class _StepCircle extends StatelessWidget {
  final String number;
  final _StepCircleState state;

  const _StepCircle({
    required this.number,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDone = state == _StepCircleState.done;
    final bool isActive = state == _StepCircleState.active;
    final bool isUpcoming = state == _StepCircleState.upcoming;

    final Color borderColor =
        isDone || isActive ? AppColor.primaryColor : AppColor.greyDividerColor;

    final Color bgColor = isDone ? AppColor.primaryColor : AppColor.whiteColor;

    final Color textColor = isDone
        ? AppColor.whiteColor
        : (isActive ? AppColor.primaryColor : AppColor.greyDividerColor);

    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: AppText(
        text: number,
        appTextTheme: AppTextTheme.numberSmallTextStyle().copyWith(
          color: textColor,
        ),
      ),
    );
  }
}

class _StepLabel extends StatelessWidget {
  final String text;
  final int stepNumber;
  final int activeStep;

  const _StepLabel({
    required this.text,
    required this.stepNumber,
    required this.activeStep,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPassedOrActive = activeStep >= stepNumber;

    return AppText(
      text: text,
      appTextTheme: AppTextTheme.numberSmallTextStyle().copyWith(
          color: isPassedOrActive
              ? AppColor.primaryColor
              : AppColor.greyDividerColor,
          fontSize: 10),
    );
  }
}
