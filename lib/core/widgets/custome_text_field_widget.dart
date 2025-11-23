import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import '../../../l10n/app_locale.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final bool? readOnly;
  final int? maxLength;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final Color? borderSideColor;
  final bool? enabled;
  final int? maxLine;
  final Color? suffixIconColor;
  final TextAlign? textAlign;
  final double? borderRadius;
  final bool? obscureText;
  final Widget? prefixIcon;
  final double? width;
  final double? height;
  final String? lable;
  final String? obscuringCharacter;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final bool enableShadow;
  final Color? shadowTextFieldColor;
  final double shadowBlur;
  final double shadowSpread;
  final Offset shadowOffset;
  final EdgeInsetsGeometry? shadowMargin;
  const CustomTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.onTap,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.validator,
    this.controller,
    this.onChanged,
    this.readOnly,
    this.textStyle,
    this.borderSideColor,
    this.borderSide,
    this.enabled,
    this.maxLength,
    this.textInputType,
    this.maxLine,
    this.suffixIconColor,
    this.textAlign,
    this.borderRadius,
    this.height,
    this.prefixIcon,
    this.lable,
    this.obscureText = false,
    this.width = 360,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.obscuringCharacter,
    this.enableShadow = false,
    this.shadowTextFieldColor,
    this.shadowBlur = 100,
    this.shadowSpread = 0,
    this.shadowOffset = const Offset(0, 15),
    this.shadowMargin,
  });

  @override
  Widget build(BuildContext context) {
    final double r = (borderRadius ?? 2).r;
    final Color effectiveShadowColor =
        (shadowTextFieldColor ?? const Color(0xFF101828)).withOpacity(1.0);

    final input = TextFormField(
      obscuringCharacter: obscuringCharacter ?? "*",
      textAlign: textAlign ??
          (AppLocale.shared.isArabic() ? TextAlign.right:TextAlign.left  ),
      keyboardType: textInputType,
      enabled: enabled,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      cursorColor: Theme.of(context).colorScheme.primary,
      controller: controller,
      obscureText: isObscureText ?? false,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      decoration: InputDecoration(
        label: lable != null ? Text(lable ?? '') : null,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorStyle: const TextStyle(
          fontSize: 14.0,
          fontFamily: 'IBM Plex Sans Arabic',
        ),
        isDense: true,
        contentPadding: contentPadding,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(r),
              borderSide: BorderSide(
                color: borderSideColor ?? AppColor.greyBorderColor,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(r),
              borderSide: BorderSide(
                color: borderSideColor ?? AppColor.greyBorderColor,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(r),
          borderSide: BorderSide(
            color: borderSideColor ?? AppColor.greyBorderColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(r),
          borderSide: BorderSide(
            color: borderSideColor ?? AppColor.greyBorderColor,
          ),
        ),
        hintStyle:
            hintStyle ?? TextStyle(color: AppColor.blackNumberSmallColor),
        hintText: hintText,
        suffixIconColor: suffixIconColor,
        fillColor: backgroundColor ?? Colors.white,
        filled: true,
      ),
      style: textStyle ?? const TextStyle(),
      showCursor: true,
      cursorWidth: 2,
      maxLength: maxLength,
      maxLines: maxLine ?? 1,
    );

    // بدون شادو
    if (!enableShadow) {
      return SizedBox(width: width, height: height, child: input);
    }

    // شادو من الأسفل فقط (Offset(0,15) + Blur 48 + Spread 0) ولون #101828 بعتامة كاملة
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        // نترك هامش سفلي بسيط لتفادي قص الشادو داخل الأب
        margin: shadowMargin ?? EdgeInsets.only(bottom: 10.w),
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: const [],
          ).copyWith(
            boxShadow: [
              BoxShadow(
                color: effectiveShadowColor,
                blurRadius: shadowBlur,
                spreadRadius: shadowSpread,
                offset: shadowOffset,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(r),
            child: input,
          ),
        ),
      ),
    );
  }
}
