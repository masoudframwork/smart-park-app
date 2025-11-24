import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/domain/vehicle_form_state.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/presentation/controller/another_vehicle_controller.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custome_text_field_widget.dart';
import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/arraw_widget_screen.dart';
import '../../../../../generated/l10n.dart';

class VehicleDataScreen extends ConsumerWidget {
  const VehicleDataScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vehicleFormControllerProvider);
    final controller = ref.read(vehicleFormControllerProvider.notifier);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.settingsBackgroundColor,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButtonWidget(
                borderRadius: 10.r,
                //حفظ المركبة
                text: S.of(context).saveVehicle,
                onPressed: () {
                  NavigationService.go('${RoutePaths.bottomNavBar}?tab=2');
                },
                backgroundColor: AppColor.primaryColor,
              ),
              SizedBox(height: 13.h),
              CustomButtonWidget(
                borderRadius: 10.r,
                type: ButtonType.outlined,
                textStyle: AppTextTheme.titleMediumTextStyle().copyWith(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                //لاحقا
                text: S.of(context).do_this_later,
                onPressed: () {
                  NavigationService.push(RoutePaths.bottomNavBar);
                },
                backgroundColor: AppColor.primaryColor,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),

                ArrawWidgetCustomeBar(
                  onTap: () {
                    NavigationService.pop();
                  },
                  title: S.of(context).enteryourvehicleinfo,
                ),
                SizedBox(height: 50.h),
                _VehicleTypeTabs(
                  selected: state.vehicleType,
                  onChanged: controller.setVehicleType,
                ),
                SizedBox(height: 24.h),
                if (state.isSaudi) ...[
                  //نوع اللوحة
                  _LabelWithStar(text: S.of(context).platetype),
                  SizedBox(height: 8.h),
                  _PlateTypeDropdown(
                    value: state.plateType,
                    onChanged: controller.setPlateType,
                    showError: state.showErrors && (state.plateType == null),
                  ),
                  SizedBox(height: 16.h),
                  //رقم للوحة
                  _LabelWithStar(text: S.of(context).platenumber),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      _PlateTextField(
                        width: 157.w,
                        hintText: '0000',
                        keyboardType: TextInputType.number,
                        onChanged: controller.setSaudiNumbers,
                        validator: (value) {
                          if (!state.showErrors) return null;
                          if (value.length != 4) {
                            return 'أدخل 4 أرقام';
                          }
                          return null;
                        },
                      ),
                      SizedBox(width: 20.w),
                      _PlateTextField(
                        width: 168.w,
                        hintText: 'أ ب ج',
                        keyboardType: TextInputType.text,
                        onChanged: controller.setSaudiLetters,
                        validator: (value) {
                          if (!state.showErrors) return null;
                          if (value.length != 3) {
                            return 'أدخل 3 أحرف';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ] else ...[
                  _LabelWithStar(text: S.of(context).platenumber),
                  SizedBox(height: 8.h),
                  _PlateTextField(
                    hintText: '',
                    keyboardType: TextInputType.text,
                    onChanged: controller.setNonSaudiPlate,
                    validator: (value) {
                      if (!state.showErrors) return null;
                      if (value.isEmpty) {
                        return 'رقم اللوحة مطلوب';
                      }
                      return null;
                    },
                  ),
                ],
                SizedBox(height: 16.h),
                //لون المركبة
                _LabelWithStar(text: S.of(context).vehiclecolor),
                SizedBox(height: 8.h),
                _VehicleColorDropdown(
                  value: state.vehicleColor,
                  onChanged: controller.setVehicleColor,
                  showError:
                      state.showErrors && (state.vehicleColor?.isEmpty ?? true),
                ),
                SizedBox(height: 16.h),
                AppText(
                  text: S.of(context).avatar,
                  appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 8.h),
                _AvatarDropdown(
                  value: state.avatar,
                  onChanged: controller.setAvatar,
                  showError:
                      state.showErrors && (state.avatar?.isEmpty ?? true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _VehicleTypeTabs extends StatelessWidget {
  final VehicleType selected;
  final ValueChanged<VehicleType> onChanged;

  const _VehicleTypeTabs({
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSaudi = selected == VehicleType.saudi;

    BorderRadius buildRadius({
      required bool isLeft,
      required bool active,
    }) {
      if (isLeft) {
        return BorderRadius.only(
          topLeft: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topRight: Radius.circular((active ? 4 : 6).r),
        );
      } else {
        return BorderRadius.only(
          topLeft: Radius.circular((active ? 4 : 6).r),
          bottomLeft: Radius.circular((active ? 4 : 6).r),
          topRight: const Radius.circular(0),
          bottomRight: const Radius.circular(0),
        );
      }
    }

    Widget buildTab({
      required String text,
      required bool active,
      required bool isLeft,
      required VoidCallback onTap,
    }) {
      return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 32.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: active ? AppColor.secondaryColor : Colors.white,
              borderRadius: buildRadius(isLeft: isLeft, active: active),
            ),
            child: AppText(
              text: text,
              appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
                color: active ? AppColor.whiteColor : AppColor.blackColor,
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        buildTab(
          //مركبة سعودية
          text: S.of(context).saudivehicle,
          active: isSaudi,
          isLeft: true,
          onTap: () => onChanged(VehicleType.saudi),
        ),
        buildTab(
          //مركبة غير  سعودية
          text: S.of(context).nonsaudivehicle,
          active: !isSaudi,
          isLeft: false,
          onTap: () => onChanged(VehicleType.nonSaudi),
        ),
      ],
    );
  }
}

class _LabelWithStar extends StatelessWidget {
  final String text;
  const _LabelWithStar({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          text: text,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(width: 2),
        const Text(
          '*',
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}

class _AppDropdownField extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  final List<String> items;
  final String? errorText;

  const _AppDropdownField({
    required this.value,
    required this.onChanged,
    required this.items,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: onChanged,
      decoration: _dropdownDecoration(errorText: errorText),
    );
  }
}

class _PlateTypeDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  final bool showError;

  const _PlateTypeDropdown({
    required this.value,
    required this.onChanged,
    required this.showError,
  });

  @override
  Widget build(BuildContext context) {
    const items = <String>[
      'خصوصي',
      'نقل عام',
      'أجرة',
      'دبلوماسية',
    ];

    final String? errorText =
        showError && value == null ? 'اختر نوع اللوحة' : null;

    return _AppDropdownField(
      value: value,
      onChanged: onChanged,
      items: items,
      errorText: errorText,
    );
  }
}

class _PlateTextField extends StatelessWidget {
  final double? width;
  final String hintText;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final String? Function(String value)? validator;

  const _PlateTextField({
    this.width,
    required this.hintText,
    required this.keyboardType,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final field = CustomTextFormField(
      width: width,
      hintText: hintText,
      hintStyle: AppTextTheme.numberSmallTextStyle().copyWith(
        color: AppColor.greyBorderColor,
        fontWeight: FontWeight.w300,
      ),
      borderSideColor: AppColor.greyDividerColor,
      textInputType: keyboardType,
      borderRadius: 10,
      onChanged: onChanged,
      validator: (value) {
        if (validator == null) return null;
        return validator!(value ?? '');
      },
    );

    if (width == null) return field;

    return SizedBox(
      width: width,
      child: field,
    );
  }
}

class _VehicleColorDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  final bool showError;

  const _VehicleColorDropdown({
    required this.value,
    required this.onChanged,
    required this.showError,
  });

  @override
  Widget build(BuildContext context) {
    const colors = <String>[
      'أبيض',
      'أسود',
      'فضي',
      'أحمر',
      'أزرق',
      'أخضر',
    ];

    final String? errorText =
        showError && value == null ? 'اختر لون المركبة' : null;

    return _AppDropdownField(
      value: value,
      onChanged: onChanged,
      items: colors,
      errorText: errorText,
    );
  }
}

class _AvatarDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  final bool showError;

  const _AvatarDropdown({
    required this.value,
    required this.onChanged,
    required this.showError,
  });

  @override
  Widget build(BuildContext context) {
    const avatars = <String>[
      '🚗 سيارة صغيرة',
      '🚙 دفع رباعي',
      '🚕 تاكسي',
    ];

    final String? errorText =
        showError && value == null ? 'اختر صورة رمزية' : null;

    return _AppDropdownField(
      value: value,
      onChanged: onChanged,
      items: avatars,
      errorText: errorText,
    );
  }
}

InputDecoration _dropdownDecoration({String? errorText}) {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
    filled: true,
    fillColor: AppColor.whiteColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColor.greyDividerColor,
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColor.greyDividerColor,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColor.greyDividerColor,
        width: 1.2,
      ),
    ),
    errorText: errorText,
  );
}
