import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/helpers/show_change_vehicle_dialog.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../../../../core/widgets/custome_text_field_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/required_field_label.dart';
import '../../../../generated/l10n.dart';
import '../../../details_reserve_parking_spot/booking_step1/presentation/widget/bottom_sheet/continue_paying_bottom_sheet.dart';

class ElectronicPaymentCards extends StatelessWidget {
  const ElectronicPaymentCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteBackgroundColor,
        appBar: CustomAppBar(
          backgroundColor: AppColor.backgroundAppBarColor,
          leading: CircleImageButton(
            imageUrl: AppImages.appLogo,
            size: 37,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            spacing: 18.h,
            children: [
              Row(
                spacing: 15,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 34.w,
                      height: 34.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColor.contanearGreyColor,
                          width: 1,
                        ),
                      ),
                      child: CustomImageWidget(
                        imageUrl: AppImages.arrowIcon2,
                        width: 20.w,
                        height: 20.w,
                        isFlag: true,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  AppText(
                    text: S.of(context).pre_saved_cards,
                    appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
              _VehiclesStepContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class _VehiclesStepContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        SavedCardTile(
          cardNumber: '000 000 000 000',
          expiryDate: '2027/5/30',
          cvv: '123',
          onTap: () {},
          onDelete: () {},
        ),
        SizedBox(height: 8.h),
        TheVehicleTiles(
          title:  S.of(context).new_card,
          bgColor: AppColor.whiteColor,
          borderColor: AppColor.whiteColor,
          carIcon: const SizedBox.shrink(),
          isAddNew: true,
          onTap: () {
            showBlurBottomSheet(
              context: context,
              child: const NewCardBottomSheet(),
            );
          },
        ),
      ],
    );
  }
}

class SavedCardTile extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const SavedCardTile({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: 357.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: AppColor.lightPurpleColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // VISA BOX
            Container(
              width: 71.w,
              height: 61.h,
              decoration: BoxDecoration(
                color: AppColor.textColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: CustomImageWidget(
                imageUrl: AppImages.visaImage,
                width: 40.w,
                height: 24.h,
                isFlag: true,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(width: 12.w),

            // TEXT SECTION (aligned vertically nicely)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // card number
                  AppText(
                    text: cardNumber,
                    appTextTheme: AppTextTheme.titleMediumTextStyle(),
                  ),
                  SizedBox(height: 8.h),

                  // expiry date + cvv
                  Row(
                    children: [
                      // EXPIRY
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: S.of(context).expiry_date,
                            appTextTheme: AppTextTheme.bodySmallTextStyle()
                                .copyWith(color: AppColor.greyCard),
                          ),
                          SizedBox(height: 2.h),
                          AppText(
                            text: 'CVV',

                            appTextTheme: AppTextTheme.bodySmallTextStyle()
                                .copyWith(color: AppColor.greyCard),
                          ),
                        ],
                      ),

                      SizedBox(width: 35.w),

                      // CVV
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: expiryDate,
                            appTextTheme: AppTextTheme.bodySmallTextStyle()
                                .copyWith(color: AppColor.greyColor),
                          ),
                          SizedBox(height: 2.h),
                          AppText(
                            text: cvv,
                            appTextTheme: AppTextTheme.bodySmallTextStyle()
                                .copyWith(color: AppColor.greyCard),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // DELETE ICON
            GestureDetector(
              onTap: onDelete,
              child: Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: SvgPicture.asset(
                  AppImages.delete,
                  width: 18.w,
                  height: 18.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TheVehicleTiles extends StatelessWidget {
  final bool isSelected;
  final bool isAddNew;

  final Color bgColor;
  final Color borderColor;

  final Widget carIcon;
  final String title;
  final TextStyle? textStyle;

  final double tileWidth;
  final double tileHeight;
  final VoidCallback? onTap;

  final Widget? trailingIcon;

  const TheVehicleTiles({
    super.key,
    required this.bgColor,
    required this.borderColor,
    required this.title,
    required this.carIcon,
    this.textStyle,
    this.isSelected = false,
    this.isAddNew = false,
    this.tileWidth = 357,
    this.tileHeight = 66,
    this.onTap,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedBg = AppColor.secondaryColor;
    final Color selectedBorder = AppColor.secondaryColor;
    final Color selectedTextColor = AppColor.whiteColor;

    final Color effectiveBg = isSelected ? selectedBg : bgColor;
    final Color effectiveBorder = isSelected ? selectedBorder : borderColor;
    final Color effectiveText = isSelected
        ? selectedTextColor
        : (textStyle?.color ?? AppColor.blackColor);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        width: tileWidth.w,
        height: tileHeight.h,
        decoration: BoxDecoration(
          color: effectiveBg,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: effectiveBorder,
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            _buildLeadingBox(),
            SizedBox(width: 12.w),
            AppText(
              text: title,
              appTextTheme:
                  (textStyle ?? AppTextTheme.bodyMediumTextStyle()).copyWith(
                color: effectiveText,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
            if (trailingIcon != null) ...[
              Spacer(),
              trailingIcon!,
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLeadingBox() {
    if (isAddNew) {
      return CustomImageWidget(
        imageUrl: AppImages.add,
        width: 24.w,
        height: 24.w,
        isFlag: true,
        color: AppColor.secondaryColor,
      );
    }

    return Container(
      width: 55.w,
      height: 47.h,
      decoration: BoxDecoration(
        color: AppColor.textColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: Alignment.center,
      child: carIcon,
    );
  }
}
class NewCardBottomSheet extends ConsumerWidget {
  const NewCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBottomSheet(
      maxHeightFactor: 0.62,
      title: S.of(context).new_card,
      headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
      body: Material(
        color: AppColor.settingsBackgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _NewCardForm(),
                SizedBox(height: 24.h),
                CustomButtonWidget(
                  type: ButtonType.elevated,
                  borderRadius: 10.r,
                  text:S.of(context).saveCard,
                  textStyle: AppTextTheme.mainButtonTextStyle(),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
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
        RequiredFieldLabel(
          text: S.of(context).card_type,
          textColor: AppColor.blackColor,
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
                width: 40.w,
                height: 28.h,
                isFlag: true,
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
        RequiredFieldLabel(
          text: S.of(context).card_number,
          textColor: AppColor.blackColor,
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            color: AppColor.blackNumberSmallColor,
            fontWeight: FontWeight.w600,
          ),
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
        RequiredFieldLabel(
          text:  S.of(context).name,
          textColor: AppColor.blackColor,
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            color: AppColor.blackNumberSmallColor,
            fontWeight: FontWeight.w600,
          ),
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
                  RequiredFieldLabel(
                    text: S.of(context).expiry_date,
                    textColor: AppColor.blackColor,
                    appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                      color: AppColor.blackNumberSmallColor,
                      fontWeight: FontWeight.w600,
                    ),
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
                  RequiredFieldLabel(
                    text: 'CVV',
                    textColor: AppColor.blackColor,
                    appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                      color: AppColor.blackNumberSmallColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
