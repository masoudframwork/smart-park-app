import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_image_widget.dart';
import '../../../domain/models/timer_state.dart';
import '../../controller/timer_controller.dart';

class BookingDetailTimer extends StatelessWidget {
  final TimerState timerState;
  final TimerController timerController;

  const BookingDetailTimer({
    super.key,
    required this.timerState,
    required this.timerController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.w,
      height: 240.w,
      child: Stack(
        children: [
          CustomImageWidget(
            imageUrl: AppImages.timerClock,
            width: 240.w,
            height: 240.w,
            color: AppColor.whiteColor,
            isFlag: true,
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: CircularProgressIndicator(
                value: timerState.progress,
                strokeWidth: 16.w,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(AppColor.primaryColor),
                strokeCap: StrokeCap.butt,
              ),
            ),
          ),
          Center(
            child: AppText(
              text: timerController.getFormattedTime(),
              appTextTheme: AppTextTheme.numberLargeTextStyle().copyWith(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
