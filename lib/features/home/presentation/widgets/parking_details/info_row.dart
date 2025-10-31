import 'package:flutter/material.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/widgets/svg_image_widget.dart';

class InfoRow extends StatelessWidget {
  final String image;
  final String text;

  const InfoRow({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgImageWidget(image),
        SizedBox(width: 13.5),
        AppText(
          text: text,
          appTextTheme: AppTextTheme.bodyMediumTextStyle(),
        ),
      ],
    );
  }
}
