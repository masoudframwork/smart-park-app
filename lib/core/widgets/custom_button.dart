// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../theme/app_color.dart';
// import '../theme/app_text_theme.dart';
// import 'app_text.dart';
//
// enum ButtonType { elevated, outlined }
//
// enum ButtonIconLayout { separate, inline }
//
// class CustomButtonWidget extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final ButtonType type;
//   final double verticalPadding;
//   final double width;
//   final double height;
//   final Color? shadowColor;
//
//   final double borderRadius;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final Offset? offset;
//
//   final EdgeInsetsGeometry? outerPadding;
//
//   final Widget? icon;
//   final bool iconOnRight;
//   final ButtonIconLayout iconLayout;
//
//   final TextStyle? textStyle;
//
//   final double? fontSize;
//
//   const CustomButtonWidget({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.type = ButtonType.elevated,
//     this.width = 360,
//     this.height = 50,
//     this.borderRadius = 5,
//     this.backgroundColor,
//     this.borderColor,
//     this.outerPadding,
//     this.verticalPadding = 14,
//     this.shadowColor,
//     this.offset,
//     this.icon,
//     this.iconOnRight = true,
//     this.iconLayout = ButtonIconLayout.separate,
//     this.textStyle,
//     this.fontSize,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle baseStyle = type == ButtonType.elevated
//         ? AppTextTheme.mainButtonTextStyle()
//         : AppTextTheme.secondaryButtonTextStyle();
//
//     final TextStyle effectiveTextStyle = (textStyle ?? baseStyle).copyWith(
//       fontSize: fontSize != null ? fontSize!.sp : null,
//     );
//
//     final BorderRadiusGeometry radius = BorderRadius.circular(borderRadius.r);
//
//     Widget buildInlineContent() {
//       if (icon == null) {
//         return Center(
//           child: AppText(
//             text: text,
//             appTextTheme: effectiveTextStyle,
//           ),
//         );
//       }
//
//       final children = <Widget>[
//         if (!iconOnRight)
//           Padding(
//             padding: EdgeInsetsDirectional.only(end: verticalPadding.w),
//             child: SizedBox(
//               height: 24.w,
//               width: 24.w,
//               child: Center(child: icon),
//             ),
//           ),
//         AppText(
//           text: text,
//           appTextTheme: effectiveTextStyle,
//         ),
//         if (iconOnRight)
//           Padding(
//             padding: EdgeInsetsDirectional.only(start: verticalPadding.w),
//             child: SizedBox(
//               height: 24.w,
//               width: 24.w,
//               child: Center(child: icon),
//             ),
//           ),
//       ];
//
//       return Center(
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           textDirection: TextDirection.rtl,
//           children: children,
//         ),
//       );
//     }
//
//     Widget buildSeparateContent() {
//       return Stack(
//         alignment: Alignment.center,
//         children: [
//           Center(
//             child: AppText(
//               text: text,
//               appTextTheme: effectiveTextStyle,
//             ),
//           ),
//           if (icon != null)
//             Positioned(
//               right: iconOnRight ? verticalPadding.w : null,
//               left: iconOnRight ? null : verticalPadding.w,
//               child: SizedBox(
//                 height: 24.w,
//                 width: 24.w,
//                 child: Center(child: icon),
//               ),
//             ),
//         ],
//       );
//     }
//
//     Widget buildContent() {
//       return iconLayout == ButtonIconLayout.inline
//           ? buildInlineContent()
//           : buildSeparateContent();
//     }
//
//     final Widget child = buildContent();
//
//     final ButtonStyle style = type == ButtonType.outlined
//         ? OutlinedButton.styleFrom(
//             side: BorderSide(
//               color: borderColor ?? AppColor.primaryColor,
//               width: 1,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: radius,
//             ),
//             padding: EdgeInsets.zero,
//           )
//         : ElevatedButton.styleFrom(
//             backgroundColor: backgroundColor ?? AppColor.primaryColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: radius,
//             ),
//             padding: EdgeInsets.zero,
//             elevation: 0,
//           );
//
//     return Padding(
//       padding: outerPadding ?? EdgeInsets.zero,
//       child: SizedBox(
//         width: width.w,
//         height: height.h,
//         child: type == ButtonType.outlined
//             ? OutlinedButton(
//                 onPressed: onPressed,
//                 style: style,
//                 child: child,
//               )
//             : ElevatedButton(
//                 onPressed: onPressed,
//                 style: style,
//                 child: child,
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';
import 'app_text.dart';

enum ButtonType { elevated, outlined }
enum ButtonIconLayout { separate, inline, center, rightInline,inlineWithNumber }

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final double verticalPadding;
  final double width;
  final double height;
  final Color? shadowColor;

  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Offset? offset;

  final EdgeInsetsGeometry? outerPadding;

  final Widget? icon;
  final bool iconOnRight;
  final ButtonIconLayout iconLayout;

  final TextStyle? textStyle;
  final double? fontSize;

  final String? trailingNumber;
  final TextStyle? trailingNumberStyle;
  final Widget? riyalIcon;
  final double centerGap;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.elevated,
    this.width = 360,
    this.height = 50,
    this.borderRadius = 5,
    this.backgroundColor,
    this.borderColor,
    this.outerPadding,
    this.verticalPadding = 14,
    this.shadowColor,
    this.offset,
    this.icon,
    this.iconOnRight = true,
    this.iconLayout = ButtonIconLayout.separate,
    this.textStyle,
    this.fontSize,

    this.trailingNumber,
    this.trailingNumberStyle,
    this.riyalIcon,
    this.centerGap = 8,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle baseStyle = type == ButtonType.elevated
        ? AppTextTheme.mainButtonTextStyle()
        : AppTextTheme.secondaryButtonTextStyle();

    final TextStyle effectiveTextStyle = (textStyle ?? baseStyle).copyWith(
      fontSize: fontSize?.sp,
    );

    final TextStyle effectiveNumberStyle =
    (trailingNumberStyle ?? effectiveTextStyle.copyWith(fontWeight: FontWeight.w700));

    final BorderRadiusGeometry radius = BorderRadius.circular(borderRadius.r);

    Widget buildInlineContent() {
      if (icon == null) {
        return Center(child: AppText(text: text, appTextTheme: effectiveTextStyle));
      }
      final children = <Widget>[
        if (!iconOnRight)
          Padding(
            padding: EdgeInsetsDirectional.only(end: verticalPadding.w),
            child: SizedBox(height: 24.w, width: 24.w, child: Center(child: icon)),
          ),
        AppText(text: text, appTextTheme: effectiveTextStyle),
        if (iconOnRight)
          Padding(
            padding: EdgeInsetsDirectional.only(start: verticalPadding.w),
            child: SizedBox(height: 24.w, width: 24.w, child: Center(child: icon)),
          ),
      ];
      return Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: children,
        ),
      );
    }

    Widget buildCenterContent() {
      return Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (riyalIcon != null) ...[
                      SizedBox(height: 20.w, child: FittedBox(child: riyalIcon)),
                      SizedBox(width: 4.w),
                    ],
                    SizedBox(height: 24.w, width: 24.w, child: Center(child: icon)),
                  ],
                ),
                SizedBox(width: centerGap.w),
              ],
              if (trailingNumber != null) ...[
                AppText(text: trailingNumber!, appTextTheme: effectiveNumberStyle),
                SizedBox(width: centerGap.w),
              ],
              AppText(text: text, appTextTheme: effectiveTextStyle),
            ],
          ),
        ),
      );
    }

    Widget buildRightInlineContent() {
      if (icon == null) {
        return Center(child: AppText(text: text, appTextTheme: effectiveTextStyle));
      }
      return Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(text: text, appTextTheme: effectiveTextStyle),
            SizedBox(width: 8.w),
            SizedBox(height: 24.w, width: 24.w, child: Center(child: icon)),
          ],
        ),
      );
    }

    Widget buildSeparateContent() {
      return Stack(
        alignment: Alignment.center,
        children: [
          Center(child: AppText(text: text, appTextTheme: effectiveTextStyle)),
          if (icon != null)
            Positioned(
              right: iconOnRight ? verticalPadding.w : null,
              left: iconOnRight ? null : verticalPadding.w,
              child: SizedBox(height: 24.w, width: 24.w, child: Center(child: icon)),
            ),
        ],
      );
    }
    Widget buildInlineWithNumberContent() {
      return Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            spacing: 2.w,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null && !iconOnRight) ...[
                SizedBox(height: 24.w, width: 24.w, child: Center(child: icon)),
                SizedBox(width: centerGap.w),
              ],
              if (riyalIcon != null) ...[
                SizedBox(height: 11.w, child: FittedBox(child: riyalIcon)),
                SizedBox(width: 4.w),
              ],
              if (trailingNumber != null) ...[
                AppText(text: trailingNumber!, appTextTheme: effectiveNumberStyle),
                SizedBox(width: centerGap.w),
              ],
              AppText(text: text, appTextTheme: effectiveTextStyle),
              if (icon != null && iconOnRight) ...[
                SizedBox(width: centerGap.w),
                SizedBox(height: 24.w, width: 24.w, child: Center(child: icon)),
              ],
            ],
          ),
        ),
      );
    }

    Widget buildContent() {
      switch (iconLayout) {
        case ButtonIconLayout.inline:
          return buildInlineContent();
        case ButtonIconLayout.center:
          return buildCenterContent();
        case ButtonIconLayout.rightInline:
          return buildRightInlineContent();
        case ButtonIconLayout.inlineWithNumber:
          return buildInlineWithNumberContent();
        case ButtonIconLayout.separate:
        default:
          return buildSeparateContent();
      }
    }

    final Widget child = buildContent();

    final ButtonStyle style = type == ButtonType.outlined
        ? OutlinedButton.styleFrom(
      side: BorderSide(color: borderColor ?? AppColor.primaryColor, width: 1),
      shape: RoundedRectangleBorder(borderRadius: radius),
      padding: EdgeInsets.zero,
    )
        : ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: radius),
      padding: EdgeInsets.zero,
      elevation: 0,
    );

    return Padding(
      padding: outerPadding ?? EdgeInsets.zero,
      child: SizedBox(
        width: width.w,
        height: height.h,
        child: type == ButtonType.outlined
            ? OutlinedButton(onPressed: onPressed, style: style, child: child)
            : ElevatedButton(onPressed: onPressed, style: style, child: child),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../theme/app_color.dart';
// import '../theme/app_text_theme.dart';
// import 'app_text.dart';
//
// enum ButtonType { elevated, outlined }
//
// enum ButtonIconLayout { separate, inline, center, rightInline }
//
// class CustomButtonWidget extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final ButtonType type;
//   final double verticalPadding;
//   final double width;
//   final double height;
//   final Color? shadowColor;
//
//   final double borderRadius;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final Offset? offset;
//
//   final EdgeInsetsGeometry? outerPadding;
//
//   final Widget? icon;
//   final bool iconOnRight;
//   final ButtonIconLayout iconLayout;
//
//   final TextStyle? textStyle;
//
//   final double? fontSize;
//
//   const CustomButtonWidget({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.type = ButtonType.elevated,
//     this.width = 360,
//     this.height = 50,
//     this.borderRadius = 5,
//     this.backgroundColor,
//     this.borderColor,
//     this.outerPadding,
//     this.verticalPadding = 14,
//     this.shadowColor,
//     this.offset,
//     this.icon,
//     this.iconOnRight = true,
//     this.iconLayout = ButtonIconLayout.separate,
//     this.textStyle,
//     this.fontSize,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle baseStyle = type == ButtonType.elevated
//         ? AppTextTheme.mainButtonTextStyle()
//         : AppTextTheme.secondaryButtonTextStyle();
//
//     final TextStyle effectiveTextStyle = (textStyle ?? baseStyle).copyWith(
//       fontSize: fontSize?.sp,
//     );
//
//     final BorderRadiusGeometry radius = BorderRadius.circular(borderRadius.r);
//
//     Widget buildInlineContent() {
//       if (icon == null) {
//         return Center(
//           child: AppText(text: text, appTextTheme: effectiveTextStyle),
//         );
//       }
//
//       final children = <Widget>[
//         if (!iconOnRight)
//           Padding(
//             padding: EdgeInsetsDirectional.only(end: verticalPadding.w),
//             child: SizedBox(
//               height: 24.w,
//               width: 24.w,
//               child: Center(child: icon),
//             ),
//           ),
//         AppText(text: text, appTextTheme: effectiveTextStyle),
//         if (iconOnRight)
//           Padding(
//             padding: EdgeInsetsDirectional.only(start: verticalPadding.w),
//             child: SizedBox(
//               height: 24.w,
//               width: 24.w,
//               child: Center(child: icon),
//             ),
//           ),
//       ];
//
//       return Center(
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           textDirection: TextDirection.rtl,
//           children: children,
//         ),
//       );
//     }
//
//     Widget buildCenterContent() {
//       if (icon == null) {
//         return Center(
//           child: AppText(text: text, appTextTheme: effectiveTextStyle),
//         );
//       }
//
//       final List<Widget> rowChildren = iconOnRight
//           ? <Widget>[
//         AppText(text: text, appTextTheme: effectiveTextStyle),
//         SizedBox(width: 8.w),
//         SizedBox(height: 24.w, width: 24.w, child: Center(child: icon)),
//       ]
//           : <Widget>[
//         SizedBox(height: 24.w, width: 24.w, child: Center(child: icon)),
//         SizedBox(width: 8.w),
//         AppText(text: text, appTextTheme: effectiveTextStyle),
//       ];
//
//       return Center(
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: rowChildren,
//         ),
//       );
//     }
//
//     Widget buildRightInlineContent() {
//       if (icon == null) {
//         return Center(
//           child: AppText(text: text, appTextTheme: effectiveTextStyle),
//         );
//       }
//       return Center(
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             AppText(text: text, appTextTheme: effectiveTextStyle),
//             SizedBox(width: 8.w),
//             SizedBox(height: 24.w, width: 24.w, child: Center(child: icon)),
//           ],
//         ),
//       );
//     }
//
//     Widget buildSeparateContent() {
//       return Stack(
//         alignment: Alignment.center,
//         children: [
//           Center(
//             child: AppText(text: text, appTextTheme: effectiveTextStyle),
//           ),
//           if (icon != null)
//             Positioned(
//               right: iconOnRight ? verticalPadding.w : null,
//               left: iconOnRight ? null : verticalPadding.w,
//               child: SizedBox(
//                 height: 24.w,
//                 width: 24.w,
//                 child: Center(child: icon),
//               ),
//             ),
//         ],
//       );
//     }
//
//     Widget buildContent() {
//       switch (iconLayout) {
//         case ButtonIconLayout.inline:
//           return buildInlineContent();
//         case ButtonIconLayout.center:
//           return buildCenterContent();
//         case ButtonIconLayout.rightInline:
//           return buildRightInlineContent();
//         case ButtonIconLayout.separate:
//         default:
//           return buildSeparateContent();
//       }
//     }
//
//     final Widget child = buildContent();
//
//     final ButtonStyle style = type == ButtonType.outlined
//         ? OutlinedButton.styleFrom(
//       side: BorderSide(
//         color: borderColor ?? AppColor.primaryColor,
//         width: 1,
//       ),
//       shape: RoundedRectangleBorder(borderRadius: radius),
//       padding: EdgeInsets.zero,
//     )
//         : ElevatedButton.styleFrom(
//       backgroundColor: backgroundColor ?? AppColor.primaryColor,
//       shape: RoundedRectangleBorder(borderRadius: radius),
//       padding: EdgeInsets.zero,
//       elevation: 0,
//     );
//
//     return Padding(
//       padding: outerPadding ?? EdgeInsets.zero,
//       child: SizedBox(
//         width: width.w,
//         height: height.h,
//         child: type == ButtonType.outlined
//             ? OutlinedButton(onPressed: onPressed, style: style, child: child)
//             : ElevatedButton(onPressed: onPressed, style: style, child: child),
//       ),
//     );
//   }
// }