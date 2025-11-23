import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/widgets/custom_button.dart';
import 'package:smart/core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import 'package:smart/features/booking/domain/models/booking_model.dart';

import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/controller/booking_step1_controller.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/widget/bottom_sheet/booking_custom_time_bottom_sheet.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/widget/bottom_sheet/another_vehicle_bottom_sheet.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/widget/bottom_sheet/continue_paying_bottom_sheet.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/widget/header_section.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/data/models/booking_flow_state.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/widget/quick_duration_grid.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/widget/the_vichel_titel.dart';

import '../../../../core/helpers/show_change_vehicle_dialog.dart';
import '../../../../generated/l10n.dart';
import '../domain/duration_states.dart';

// ✅ نستخدم نظام اللغة اللي عندك
import 'package:smart/l10n/app_locale.dart';

class BookingStep1Page extends ConsumerWidget {
  const BookingStep1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingFlowControllerProvider);
    final controller = ref.read(bookingFlowControllerProvider.notifier);
    final BookingModel reservation;
    final durationState = ref.watch(durationControllerProvider);
    final bool canContinue = state.hasVehicle &&
        state.hasDuration &&
        durationState.hours > 0 &&
        state.currentStep >= 3;

    final bool isArabic = AppLocale.shared.isArabic();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteBackgroundColor,
        appBar: CustomAppBar(
          trailing: CloseButtonCircle(onTap: () {
            controller.reset();
            Navigator.of(context).pop();
          }),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.h),
            child: Column(
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderSection(),
                SizedBox(height: 16.h),
                _StepRow(
                  index: 1,
                  //اختر المركبة
                  title: S.of(context).choosethevehicle,
                  totalSteps: 3,
                  state: state,
                  child: _VehiclesStepContent(
                    selectedId: state.selectedVehicleId,
                    onSelect: controller.selectVehicle,
                  ),
                ),
                _StepRow(
                  //حدّد مدة الوقوف
                  index: 2,
                  title: S.of(context).specifythedurationofthestop,
                  totalSteps: 3,
                  state: state,
                  child: const _DurationStepContent(),
                ),
                _SummaryStepSection(state: state),
                SizedBox(height: 12.h),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: canContinue ? 1 : 0.4,
                  child: IgnorePointer(
                    ignoring: !canContinue,
                    child: CustomButtonWidget(
                      type: ButtonType.elevated,
                      borderRadius: 10.r,
                      //الاستمرار للدفع
                      text: S.of(context).continuetopay,
                      textStyle: AppTextTheme.mainButtonTextStyle(),
                      onPressed: () {
                        showBlurBottomSheet(
                          context: context,
                          child: ContinuePayingMethodBottomSheet(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final int index;
  final int totalSteps;
  final String title;
  final BookingStep1State state;
  final Widget child;
  final double bottomSpacing;

  const _StepRow({
    required this.index,
    required this.title,
    required this.totalSteps,
    required this.state,
    required this.child,
    this.bottomSpacing = 2,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = state.currentStep >= index;

    final bool isArabic = AppLocale.shared.isArabic();

    return Row(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StepIndicator(
          index: index,
          currentStep: state.currentStep,
          totalSteps: totalSteps,
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: title,
                appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor,
                  fontSize: 20.sp,
                ),
              ),
              IgnorePointer(
                ignoring: !isEnabled,
                child: Opacity(
                  opacity: isEnabled ? 1 : 0.4,
                  child: child,
                ),
              ),
              if (bottomSpacing > 0) SizedBox(height: bottomSpacing.h),
            ],
          ),
        ),
      ],
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final int index;
  final int currentStep;
  final int totalSteps;

  const _StepIndicator({
    required this.index,
    required this.currentStep,
    required this.totalSteps,
  });

  bool get _showTopLine => index != 1;
  bool get _showBottomLine => index != totalSteps;

  double _topSegmentHeight() {
    if (!_showTopLine) return 0;
    return 0;
  }

  double _bottomSegmentHeight() {
    if (!_showBottomLine) return 0;

    if (index == 1) return 264.h;
    if (index == 2) return 264.h;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentStep == index;
    final bool isCompleted = currentStep > index;

    final Color circleColor =
        isCompleted ? AppColor.primaryColor : AppColor.whiteColor;

    final Color borderColor = (isActive || isCompleted)
        ? AppColor.primaryColor
        : AppColor.greyDividerColor;

    final Color textColor = isCompleted
        ? AppColor.whiteColor
        : (isActive ? AppColor.primaryColor : AppColor.greyColor);

    Color _topLineColor() {
      if (!_showTopLine) return Colors.transparent;
      return currentStep >= index
          ? AppColor.primaryColor
          : AppColor.greyDividerColor;
    }

    Color _bottomLineColor() {
      if (!_showBottomLine) return Colors.transparent;
      return currentStep > index
          ? AppColor.primaryColor
          : AppColor.greyDividerColor;
    }

    return SizedBox(
      width: 40.w,
      child: Column(
        children: [
          Container(
            height: _topSegmentHeight(),
            alignment: Alignment.center,
            child: Container(
              width: 1.5,
              color: _topLineColor(),
            ),
          ),
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 2),
            ),
            child: Center(
              child: AppText(
                text: '$index',
                appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
          ),
          Container(
            height: _bottomSegmentHeight(),
            alignment: Alignment.center,
            child: Container(
              width: 1.5,
              color: _bottomLineColor(),
            ),
          ),
        ],
      ),
    );
  }
}

class _VehiclesStepContent extends StatelessWidget {
  final String? selectedId;
  final ValueChanged<String> onSelect;

  const _VehiclesStepContent({
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        TheVehicleTile(
          //نيسان باتلفايندر 2023 - أسود
          title: S.of(context).nissanPathfinderBlack,
          bgColor: AppColor.whiteColor,
          borderColor: AppColor.lightPurpleColor,
          carIcon: SvgPicture.asset(
            AppImages.iconsCars,
          ),
          isSelected: selectedId == 'nissan',
          onTap: () => onSelect('nissan'),
        ),
        SizedBox(height: 8.h),
        TheVehicleTile(
          title: S.of(context).toyotaCorollaRed,
          bgColor: AppColor.whiteColor,
          borderColor: AppColor.lightPurpleColor,
          carIcon: SvgPicture.asset(
            AppImages.iconsCars,
          ),
          isSelected: selectedId == 'corolla',
          onTap: () => onSelect('corolla'),
        ),
        SizedBox(height: 8.h),
        TheVehicleTile(
          //مركبة اخرى
          title: S.of(context).newvehicle,
          bgColor: AppColor.whiteColor,
          borderColor: AppColor.whiteColor,
          carIcon: const SizedBox.shrink(),
          isAddNew: true,
          isSelected: selectedId == 'new',
          onTap: () {
            onSelect('new');

            showBlurBottomSheet(
              context: context,
              child: const AnotherVehicleBottomSheet(),
            );
          },
        ),
      ],
    );
  }
}

class _DurationStepContent extends ConsumerWidget {
  const _DurationStepContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingState = ref.watch(bookingFlowControllerProvider);
    final bookingController = ref.read(bookingFlowControllerProvider.notifier);

    final durationController = ref.read(durationControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        QuickDurationGrid(
          selectedId: bookingState.selectedDurationId,
          onSelect: (String id, double hours) {
            durationController.setHours(hours);
            bookingController.selectDuration(id);
          },
        ),
        SizedBox(height: 20.h),
        CustomButtonWidget(
          iconOnRight: false,
          type: ButtonType.outlined,
          iconLayout: ButtonIconLayout.center,
          icon: Image.asset(
            AppImages.add,
            width: 24.w,
            height: 24.w,
            color: AppColor.primaryColor,
          ),
          //تحديد المدة
          text: S.of(context).settheduration,
          textStyle: AppTextTheme.mainButtonTextStyle().copyWith(
            color: AppColor.primaryColor,
          ),
          onPressed: () {
            showBlurBottomSheet(
              context: context,
              isScrollControlled: false,
              child: const BookingCustomTimeBottomSheet(),
            );
          },
        ),
      ],
    );
  }
}

class _SummaryStepContent extends ConsumerWidget {
  final BookingStep1State state;

  const _SummaryStepContent({required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String durationLabel(double hours) {
      if (hours == 0.5) return S.of(context).minute30;
      if (hours == 1) return S.of(context).hour;
      if (hours == 2) return S.of(context).hour2;
      if (hours == 3) return S.of(context).hour3;
      if (hours == 4) return S.of(context).hour4;
      if (hours == 6) return S.of(context).hour6;
      return '${hours.toStringAsFixed(1)} ${S.of(context).hour}';
    }

    final durationState = ref.watch(durationControllerProvider);
    final double hours = durationState.hours;
    const double pricePerHour = 5;
    final double totalPrice = hours * pricePerHour;

    final bool hasVehicle = state.selectedVehicleId != null;
    final bool hasDuration = hours > 0;

    if (!hasVehicle || !hasDuration) {
      return AppText(
        text: 'يرجى اختيار المركبة ومدة الوقوف لعرض ملخص الحجز.',
        appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
          color: AppColor.greyColor,
        ),
      );
    }

    return Container(
      width: 361.w,
      height: 185.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColor.greyDividerColor),
      ),
      child: Column(
        spacing: 12.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                //الاجمالي
                text: S.of(context).total,
                appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
              Row(
                spacing: 5.w,
                children: [
                  AppText(
                    text: totalPrice.toStringAsFixed(0),
                    appTextTheme: AppTextTheme.numberLargeTextStyle().copyWith(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 38,
                    ),
                  ),
                  SvgPicture.asset(
                    AppImages.realSu,
                    color: AppColor.textColor,
                  ),
                ],
              ),
            ],
          ),
          Row(
            spacing: 5.w,
            children: [
              SvgPicture.asset(
                AppImages.pinMap,
              ),
              AppText(
                text:
                    S.of(context).zone013KhuraisRoadRiyadhKingdomofSaudiArabia,
                //'المنطقة 013 - طريق خريص، الرياض، المملكة العربية السعودية',
                appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                    color: AppColor.blackNumberSmallColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.timer,
              ),
              SizedBox(width: 6.w),
              AppText(
                text: durationLabel(hours),
                appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                  color: AppColor.blackNumberSmallColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.payments,
              ),
              SizedBox(width: 6.w),
              AppText(
                text: '${pricePerHour.toStringAsFixed(0)} ',
                appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                  color: AppColor.blackNumberSmallColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset(
                AppImages.realSu,
              ),
              AppText(
                text: S.of(context).hour,
                appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                  color: AppColor.blackNumberSmallColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryStepSection extends ConsumerWidget {
  final BookingStep1State state;

  const _SummaryStepSection({required this.state, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final durationState = ref.watch(durationControllerProvider);

    final bool isEnabled =
        state.hasVehicle && state.hasDuration && durationState.hours > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StepRow(
          index: 3,
          //ملخص الحجز
          title: S.of(context).bookingSummary,
          totalSteps: 3,
          state: state,
          bottomSpacing: 0,
          child: const SizedBox.shrink(),
        ),
        SizedBox(height: 8.h),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isEnabled ? 1 : 0.4,
          child: IgnorePointer(
            ignoring: !isEnabled,
            child: Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: _SummaryStepContent(state: state),
            ),
          ),
        ),
      ],
    );
  }
}
