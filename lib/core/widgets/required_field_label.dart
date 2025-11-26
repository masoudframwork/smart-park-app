import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';

class RequiredFieldLabel extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? starColor;

  final TextStyle? appTextTheme;

  const RequiredFieldLabel({
    super.key,
    required this.text,
    this.textColor,
    this.starColor,
    this.appTextTheme,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBaseStyle = AppTextTheme.titleMediumTextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
    );

    final baseStyle = (appTextTheme ?? defaultBaseStyle).copyWith(
      color: textColor ?? appTextTheme?.color ?? AppColor.whiteColor,
    );

    return RichText(
      text: TextSpan(
        text: text,
        style: baseStyle,
        children: [
          TextSpan(
            text: ' *',
            style: baseStyle.copyWith(
              color: starColor ?? AppColor.logOutCard,
            ),
          ),
        ],
      ),
    );
  }
}
