import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/models/timer_state.dart';
import '../controller/timer_controller.dart';

class TimerCircleWidget extends StatelessWidget {
  final TimerState timerState;
  final TimerController timerController;
  final double size;
  final double strokeWidth;
  final double fontSize;

  const TimerCircleWidget({
    super.key,
    required this.timerState,
    required this.timerController,
    this.size = 64,
    this.strokeWidth = 4,
    this.fontSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
      height: size.w,
      child: Stack(
        children: [
          SizedBox(
            width: size.w,
            height: size.w,
            child: CircularProgressIndicator(
              value: timerState.progress,
              strokeWidth: strokeWidth.w,
              backgroundColor: AppColor.greyContainerColor,
              valueColor: AlwaysStoppedAnimation(AppColor.yellowContainerColor),
            ),
          ),
          Center(
            child: AppText(
              text: timerController.getFormattedTime(),
              appTextTheme: AppTextTheme.numberSmallTextStyle().copyWith(
                fontWeight: FontWeight.w600,
                fontSize: fontSize.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}