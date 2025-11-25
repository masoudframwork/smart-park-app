import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/l10n/app_locale.dart';
import '../../../../../../core/constants/image_string.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/l10n.dart';

class _ExtendOption {
  final int price;
  final String label;

  const _ExtendOption({
    required this.price,
    required this.label,
  });
}

final _extendReservationSelectedIndexProvider =
    StateProvider.autoDispose<int?>((ref) => null);

class ExtendReservationBottomSheet extends ConsumerWidget {
  final VoidCallback? onConfirm;

  const ExtendReservationBottomSheet({
    super.key,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String title = S.of(context).extendbookingtime;
    final String confirmText = S.of(context).confirmExtension;

    final List<_ExtendOption> options = [
      _ExtendOption(
        price: 30,
        label: S.of(context).hours,
      ),
      _ExtendOption(
        price: 45,
        label: S.of(context).hour2,
      ),
      _ExtendOption(
        price: 50,
        label: S.of(context).hour3,
      ),
      _ExtendOption(
        price: 55,
        label: S.of(context).hour4,
      ),
    ];

    final int? selectedIndex =
        ref.watch(_extendReservationSelectedIndexProvider);

    final bool isArabic = AppLocale.shared.isArabic();
    return Material(
      color: Colors.transparent,
      child: AnimatedPadding(
        duration: Duration(milliseconds: 250),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16.h,
          right: 16.h,
        ),
        curve: Curves.easeOut,
        child: AppBottomSheet(
          title: title,
          maxHeightFactor: 0.55,
          headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12.h,
            children: List.generate(options.length, (index) {
              final option = options[index];
              final bool isSelected = selectedIndex == index;

              final Widget priceWidget = Row(
                children: [
                  AppText(
                    text: option.price.toString(),
                    appTextTheme: AppTextTheme.numberLargeTextStyle().copyWith(
                      color: isSelected
                          ? AppColor.whiteColor
                          : AppColor.blackNumberSmallColor,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  SvgPicture.asset(
                    AppImages.realSu,
                    width: 20.w,
                    height: 20.w,
                    color: isSelected
                        ? AppColor.whiteColor
                        : AppColor.blackNumberSmallColor,
                  ),
                ],
              );

              final Widget labelWidget = _ExtendLabel(
                text: option.label,
                isSelected: isSelected,
              );

              return GestureDetector(
                onTap: () {
                  ref
                      .read(_extendReservationSelectedIndexProvider.notifier)
                      .state = index;
                },
                child: Container(
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColor.primaryColor
                        : AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: isSelected
                          ? AppColor.primaryColor
                          : AppColor.contanearGreyColor,
                    ),
                  ),
                  child: Row(
                    textDirection:
                        isArabic ? TextDirection.ltr : TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: isArabic
                        ? [
                            priceWidget,
                            labelWidget,
                          ]
                        : [
                            priceWidget,
                            labelWidget,
                          ],
                  ),
                ),
              );
            }),
          ),
          bottomAction: CustomButtonWidget(
            type: ButtonType.elevated,
            borderRadius: 10.r,
            text: confirmText,
            onPressed: () {
              if (onConfirm != null) {
                onConfirm!();
              }
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}

class _ExtendLabel extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _ExtendLabel({
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor =
        isSelected ? AppColor.whiteColor : AppColor.textColor;
    final Color textColor =
        isSelected ? AppColor.whiteColor : AppColor.textColor;

    return Row(
      children: [
        Icon(
          Icons.add,
          size: 17,
          color: iconColor,
        ),
        AppText(
          text: text,
          appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
