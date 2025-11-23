import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/custom_image_widget.dart';
import 'package:smart/core/widgets/custome_text_field_widget.dart';
import '../../../../../generated/l10n.dart';

enum CardType { visa, mada }

final selectedCardTypeProvider = StateProvider<CardType?>((ref) => null);

class DataCardFeild extends ConsumerWidget {
  const DataCardFeild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTypeSelectorColumn(),
          SizedBox(height: 20.h),
          const _CardDataFieldsSection(),
        ],
      ),
    );
  }
}

class _CardTypeSelectorColumn extends ConsumerWidget {
  const _CardTypeSelectorColumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(selectedCardTypeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RequiredLabel(S.of(context).cardtype),
        SizedBox(height: 12.h),
        Row(
          children: [
            _CardTypeOption(
              isSelected: selectedType == CardType.visa,
              onTap: () {
                ref.read(selectedCardTypeProvider.notifier).state =
                    CardType.visa;
              },
              child: CustomImageWidget(
                imageUrl: AppImages.visaImage,
                isFlag: true,
                fit: BoxFit.contain,
                width: 52.w,
                height: 37.h,
              ),
            ),
            SizedBox(width: 18.w),
            _CardTypeOption(
              isSelected: selectedType == CardType.mada,
              onTap: () {
                ref.read(selectedCardTypeProvider.notifier).state =
                    CardType.mada;
              },
              child: CustomImageWidget(
                imageUrl: AppImages.mada,
                width: 52.w,
                height: 37.h,
                isFlag: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CardTypeOption extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final Widget child;

  const _CardTypeOption({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.r),
          border: Border.all(
            color:
                isSelected ? AppColor.primaryColor : AppColor.greyDividerColor,
            width: isSelected ? 3 : 1,
          ),
          color: AppColor.whiteColor,
        ),
        child: child,
      ),
    );
  }
}

class _CardDataFieldsSection extends StatelessWidget {
  const _CardDataFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabeledTextField(
          label: S.of(context).cardnumber,
          isRequired: true,
          textInputType: TextInputType.number,
        ),
        SizedBox(height: 12.h),
        _LabeledTextField(
          label: S.of(context).name,
          isRequired: true,
          textInputType: TextInputType.name,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            _LabeledTextField(
              label: S.of(context).expirydate,
              isRequired: true,
              hintText: 'MM/YY',
              textInputType: TextInputType.datetime,
              width: 157.w,
            ),
            SizedBox(width: 16.w),
            // CVV
            _LabeledTextField(
              label: 'CVV',
              isRequired: true,
              textInputType: TextInputType.number,
              width: 178.w,
            ),
          ],
        ),
      ],
    );
  }
}

class _RequiredLabel extends StatelessWidget {
  final String text;
  final bool isRequired;

  const _RequiredLabel(
    this.text, {
    super.key,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$text ',
        style: AppTextTheme.titleSmallTextStyle().copyWith(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w300,
        ),
        children: isRequired
            ? [
                TextSpan(
                  text: '*',
                  style: AppTextTheme.titleSmallTextStyle().copyWith(
                    color: Colors.red,
                  ),
                ),
              ]
            : [],
      ),
    );
  }
}

class _LabeledTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLength;
  final TextEditingController? controller;
  final double? width;

  const _LabeledTextField({
    super.key,
    required this.label,
    this.isRequired = false,
    this.hintText,
    this.textInputType,
    this.maxLength,
    this.controller,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RequiredLabel(label, isRequired: isRequired),
          SizedBox(height: 6.h),
          CustomTextFormField(
            controller: controller,
            hintText: hintText,
            hintStyle: AppTextTheme.titleSmallTextStyle().copyWith(),
            textInputType: textInputType,
            maxLength: maxLength,
            borderRadius: 10.r,
            borderSideColor: AppColor.greyDividerColor,
            backgroundColor: AppColor.whiteColor,
            width: 354.w,
          ),
        ],
      ),
    );
  }
}
