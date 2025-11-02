// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../theme/app_color.dart';
// import '../theme/app_text_theme.dart';
// import 'app_text.dart';
//
// enum ButtonType { elevated, outlined }
//
// class CustomButtonWidget extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final ButtonType type;
//   final double width;
//   final double verticalPadding;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final Color? shadowColor;
//   final Offset? offset;
//   final double borderRadius;
//   final EdgeInsetsGeometry? customPadding;
//
//   const CustomButtonWidget({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.type = ButtonType.elevated,
//     this.width = double.infinity,
//     this.verticalPadding = 14,
//     this.backgroundColor,
//     this.borderColor,
//     this.customPadding,
//     this.borderRadius = 5,
//     this.shadowColor,
//     this.offset,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle buttonTextStyle = type == ButtonType.elevated
//         ? AppTextTheme.mainButtonTextStyle()
//         : AppTextTheme.secondaryButtonTextStyle();
//
//     return Padding(
//       padding: customPadding ?? EdgeInsets.zero,
//       child: SizedBox(
//         height: 40,
//         width: width == double.infinity ? width : width.w,
//         child: type == ButtonType.outlined
//             ? OutlinedButton(
//                 onPressed: onPressed,
//                 style: OutlinedButton.styleFrom(
//                   side: BorderSide(color: borderColor ?? AppColor.primaryColor),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(borderRadius.r),
//                   ),
//                 ),
//                 child: AppText(text: text, appTextTheme: buttonTextStyle),
//               )
//             : ElevatedButton(
//                 onPressed: onPressed,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: backgroundColor ?? AppColor.primaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(borderRadius.r),
//                   ),
//                 ),
//                 child: AppText(text: text, appTextTheme: buttonTextStyle),
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

enum ButtonIconLayout { separate, inline }

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
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle buttonTextStyle = type == ButtonType.elevated
        ? AppTextTheme.mainButtonTextStyle()
        : AppTextTheme.secondaryButtonTextStyle();

    final BorderRadiusGeometry radius = BorderRadius.circular(borderRadius.r);

    Widget buildInlineContent() {
      if (icon == null) {
        return Center(
          child: AppText(
            text: text,
            appTextTheme: buttonTextStyle,
          ),
        );
      }

      final children = <Widget>[
        if (!iconOnRight)
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: Center(child: icon),
            ),
          ),
        AppText(
          text: text,
          appTextTheme: buttonTextStyle,
        ),
        if (iconOnRight)
          Padding(
            padding: EdgeInsetsDirectional.only(start: 8.w),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: Center(child: icon),
            ),
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

    Widget buildSeparateContent() {
      return Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: AppText(
              text: text,
              appTextTheme: buttonTextStyle,
            ),
          ),
          if (icon != null)
            Positioned(
              right: iconOnRight ? 16.w : null,
              left: iconOnRight ? null : 16.w,
              child: SizedBox(
                height: 24.w,
                width: 24.w,
                child: Center(child: icon),
              ),
            ),
        ],
      );
    }

    Widget buildContent() {
      return iconLayout == ButtonIconLayout.inline
          ? buildInlineContent()
          : buildSeparateContent();
    }

    final Widget child = buildContent();

    final ButtonStyle style = type == ButtonType.outlined
        ? OutlinedButton.styleFrom(
            side: BorderSide(
              color: borderColor ?? AppColor.primaryColor,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: radius,
            ),
            padding: EdgeInsets.zero,
          )
        : ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: radius,
            ),
            padding: EdgeInsets.zero,
            elevation: 0,
          );

    return Padding(
      padding: outerPadding ?? EdgeInsets.zero,
      child: SizedBox(
        width: width.w,
        height: height.h,
        child: type == ButtonType.outlined
            ? OutlinedButton(
                onPressed: onPressed,
                style: style,
                child: child,
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: style,
                child: child,
              ),
      ),
    );
  }
}
