import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_bottom_sheet.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/widgets/custom_button.dart';
import 'package:smart/core/widgets/custom_image_widget.dart';
import 'package:smart/core/widgets/custome_text_field_widget.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../booking/domain/models/booking_model.dart';
import '../../../domain/duration_states.dart';

enum CardSelection {
  saved,
  newCard,
}

enum CardBrand {
  mada,
  visa,
}

final cardSelectionProvider =
    StateProvider<CardSelection>((ref) => CardSelection.saved);
late final Function(int) onTabChanged;

final cardBrandProvider = StateProvider<CardBrand>((ref) => CardBrand.mada);
late final BookingModel reservation;

class ContinuePayingMethodBottomSheet extends ConsumerWidget {
  const ContinuePayingMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(cardSelectionProvider);

    return AppBottomSheet(
      maxHeightFactor: selected == CardSelection.saved ? 0.56 : 0.80,
      title: S.of(context).paymentConfirmation,
      headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
      body: Material(
        color: AppColor.settingsBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _CardSelectionRow(),
              SizedBox(height: 20.h),
              if (selected == CardSelection.newCard) ...[
                const _NewCardForm(),
                SizedBox(height: 20.h),
              ],
              const _PaymentSummaryVisaCard(),
              SizedBox(height: 16.h),
              CustomButtonWidget(
                  type: ButtonType.elevated,
                  borderRadius: 10.r,
                  text: S.of(context).bookingconfirmation,
                  textStyle: AppTextTheme.mainButtonTextStyle(),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => BookingDetailView(
                    //
                    //     ),
                    //   ),
                    // );
                  }),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardSelectionRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(cardSelectionProvider);
    final selectionNotifier = ref.read(cardSelectionProvider.notifier);
    return Row(
      children: [
        Expanded(
          child: _CardOptionTile(
            isSelected: selected == CardSelection.saved,
            onTap: () => selectionNotifier.state = CardSelection.saved,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.r),
                    border: Border.all(
                      color: AppColor.greyContainerColor,
                      width: 1,
                    ),
                  ),
                  child: Image.asset(AppImages.visaImage),
                ),
                SizedBox(height: 6.h),
                AppText(
                  //البطاقة المنتهية 0000
                  text: S.of(context).cardendingin000,
                  appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                    color: selected == CardSelection.saved
                        ? AppColor.whiteColor
                        : AppColor.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _CardOptionTile(
            isSelected: selected == CardSelection.newCard,
            onTap: () => selectionNotifier.state = CardSelection.newCard,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.add,
                  width: 21.w,
                  height: 21.h,
                  color: selected == CardSelection.newCard
                      ? AppColor.whiteColor
                      : AppColor.primaryColor,
                ),
                SizedBox(height: 8.h),
                AppText(
                  text: S.of(context).newcard,
                  appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                    color: selected == CardSelection.newCard
                        ? AppColor.whiteColor
                        : AppColor.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CardOptionTile extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final Widget child;

  const _CardOptionTile({
    required this.isSelected,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: onTap,
      child: Container(
        height: 98.h,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.secondaryColor : AppColor.whiteColor,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: isSelected
                ? AppColor.secondaryColor
                : AppColor.contanearGreyColor,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}

class _NewCardForm extends ConsumerWidget {
  const _NewCardForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brand = ref.watch(cardBrandProvider);
    final brandNotifier = ref.read(cardBrandProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          //نوع البطاقة
          text: S.of(context).cardtype,
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            color: AppColor.blackNumberSmallColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            _BrandOption(
              isSelected: brand == CardBrand.mada,
              onTap: () => brandNotifier.state = CardBrand.mada,
              child: CustomImageWidget(
                imageUrl: AppImages.mada,
                isFlag: true,
                width: 40.w,
                height: 28.h,
              ),
            ),
            SizedBox(width: 12.w),
            _BrandOption(
              isSelected: brand == CardBrand.visa,
              onTap: () => brandNotifier.state = CardBrand.visa,
              child: Image.asset(
                AppImages.visaImage,
                width: 40.w,
                height: 28.h,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        _LabelWithStar(
          text:
              //'رقم البطاقة'
              S.of(context).cardnumber,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          width: double.infinity,
          textInputType: TextInputType.number,
          borderRadius: 8,
          backgroundColor: AppColor.whiteColor,
          borderSideColor: AppColor.greyDividerColor,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          hintStyle: AppTextTheme.bodySmallTextStyle().copyWith(
            color: AppColor.greyColor,
          ),
        ),
        SizedBox(height: 12.h),
        _LabelWithStar(
          //   text: 'الاسم'
          text: S.of(context).name,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          width: double.infinity,
          borderRadius: 8,
          backgroundColor: AppColor.whiteColor,
          borderSideColor: AppColor.greyDividerColor,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          hintStyle: AppTextTheme.bodySmallTextStyle().copyWith(
            color: AppColor.greyColor,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LabelWithStar(
                    //  text: 'تاريخ الانتهاء'
                    text: S.of(context).expirydate,
                  ),
                  SizedBox(height: 6.h),
                  CustomTextFormField(
                    width: double.infinity,
                    hintText: 'MM/YY',
                    textInputType: TextInputType.datetime,
                    borderRadius: 8,
                    backgroundColor: AppColor.whiteColor,
                    borderSideColor: AppColor.greyDividerColor,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    hintStyle: AppTextTheme.bodySmallTextStyle().copyWith(
                      color: AppColor.greyColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _LabelWithStar(text: 'CVV'),
                  SizedBox(height: 6.h),
                  CustomTextFormField(
                    width: double.infinity,
                    textInputType: TextInputType.number,
                    borderRadius: 8,
                    backgroundColor: AppColor.whiteColor,
                    borderSideColor: AppColor.greyDividerColor,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    hintStyle: AppTextTheme.bodySmallTextStyle().copyWith(
                      color: AppColor.greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Switch(
              value: true,
              onChanged: (_) {},
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              activeColor: AppColor.primaryColor,
              trackColor: WidgetStateProperty.resolveWith((states) {
                final isOn = states.contains(WidgetState.selected);
                return isOn
                    ? AppColor.primaryColor
                    : AppColor.greyContainerColor;
              }),
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              trackOutlineWidth: WidgetStateProperty.all(0),
              thumbColor: WidgetStateProperty.all(AppColor.whiteColor),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            AppText(
              text: S.of(context).savethevehicleforlateruse,

              //'احفظ البطاقة للاستخدام لاحقاً',
              appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                color: AppColor.blackNumberSmallColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BrandOption extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final Widget child;

  const _BrandOption({
    required this.isSelected,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: isSelected
                ? AppColor.primaryColor
                : AppColor.greyContainerColor,
            width: isSelected ? 3 : 1,
          ),
        ),
        child: child,
      ),
    );
  }
}

class _LabelWithStar extends StatelessWidget {
  final String text;

  const _LabelWithStar({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        AppText(
          text: text,
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            color: AppColor.blackNumberSmallColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppText(
          text: ' *',
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _PaymentSummaryVisaCard extends ConsumerWidget {
  const _PaymentSummaryVisaCard({super.key});

  String _durationLabel(double hours) {
    if (hours == 0.5) return '30 دقيقة';
    if (hours == 1) return 'ساعة';
    if (hours == 2) return 'ساعتين';
    if (hours == 3) return '3 ساعات';
    if (hours == 4) return '4 ساعات';
    if (hours == 6) return '6 ساعات';
    return '${hours.toStringAsFixed(1)} ساعة';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final durationState = ref.watch(durationControllerProvider);
    final double hours = durationState.hours;
    const double pricePerHour = 5;
    final double totalPrice = hours * pricePerHour;

    return Container(
      width: 361,
      height: 185,
      padding: EdgeInsets.all(6.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        spacing: 12.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'الإجمالي',
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
                    'المنطقة 013 - طريق خريص، الرياض، المملكة العربية السعودية',
                appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                    color: AppColor.blackNumberSmallColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                AppImages.timer,
              ),
              SizedBox(width: 6.w),
              AppText(
                text: _durationLabel(hours),
                appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                  color: AppColor.blackNumberSmallColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
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
                text: '/ساعة ',
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
