import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';

class RequiredFieldLabel extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? starColor;

  const RequiredFieldLabel({
    super.key,
    required this.text,
    this.textColor,
    this.starColor,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = AppTextTheme.titleMediumTextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
    );

    return RichText(
      text: TextSpan(
        text: text,
        style: baseStyle.copyWith(
          color: textColor ?? AppColor.whiteColor,
        ),
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
