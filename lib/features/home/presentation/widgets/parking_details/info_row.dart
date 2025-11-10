// import 'package:flutter/material.dart';
// import 'package:smart/core/theme/app_color.dart';
// import 'package:smart/core/theme/app_text_theme.dart';
// import 'package:smart/core/widgets/app_text.dart';
// import 'package:smart/core/widgets/svg_image_widget.dart';
//
// class InfoRow extends StatelessWidget {
//   final String image;
//   final String text;
//
//   const InfoRow({
//     super.key,
//     required this.image,
//     required this.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SvgImageWidget(image),
//         SizedBox(width: 13.5),
//         AppText(
//             text: text,
//             appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
//               color: AppColor.blackNumberSmallColor,
//             )),
//       ],
//     );
//   }
// }
//
// class InfoRowTheme extends StatelessWidget {
//   final String image;
//   final String text;
//
//   final String? trailingText;
//
//   final Widget? suptitel;
//
//   final double spacing;
//
//   const InfoRowTheme({
//     super.key,
//     required this.image,
//     required this.text,
//     this.trailingText,
//     this.suptitel,
//     this.spacing = 13.5,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final baseStyle = AppTextTheme.bodySmallTextStyle().copyWith(
//       color: AppColor.blackColor,
//       fontWeight: FontWeight.w400,
//     );
//     Widget rightSide;
//
//     if (trailingText != null && trailingText!.isNotEmpty) {
//       rightSide = RichText(
//         textDirection: TextDirection.rtl,
//         maxLines: 1,
//         overflow: TextOverflow.ellipsis,
//         text: TextSpan(
//           style: baseStyle,
//           children: [
//             TextSpan(text: text),
//             const TextSpan(text: ' '),
//             TextSpan(text: trailingText),
//           ],
//         ),
//       );
//     } else if (suptitel != null) {
//       rightSide = DefaultTextStyle.merge(
//         style: baseStyle,
//         child: suptitel!,
//       );
//     } else {
//       rightSide = AppText(
//         text: text,
//         appTextTheme: baseStyle,
//         textAlign: TextAlign.start,
//       );
//     }
//
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SvgImageWidget(image),
//           SizedBox(width: spacing),
//           Expanded(child: rightSide),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/widgets/svg_image_widget.dart';

class InfoRow extends StatelessWidget {
  final String image;
  final String text;

  final double iconSize;

  final String? fallbackAsset;

  const InfoRow({
    super.key,
    required this.image,
    required this.text,
    this.iconSize = 24,
    this.fallbackAsset,
  });

  bool get _isSvg => image.toLowerCase().endsWith('.svg');
  bool get _isNetwork =>
      image.startsWith('http://') || image.startsWith('https://');

  Widget _buildLeading() {
    if (_isSvg) {
      return SvgImageWidget(
        image,
        width: iconSize,
        height: iconSize,
        fallbackAsset: fallbackAsset,
      );
    } else {
      return _isNetwork
          ? Image.network(image, width: iconSize, height: iconSize, fit: BoxFit.contain)
          : Image.asset(image, width: iconSize, height: iconSize, fit: BoxFit.contain);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          _buildLeading(),
          const SizedBox(width: 13.5),
          AppText(
            text: text,
            appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
              color: AppColor.blackNumberSmallColor,
            ),

          ),
        ],
      ),
    );
  }
}

class InfoRowTheme extends StatelessWidget {
  final String image;
  final String text;

  final String? trailingText;

  final Widget? suptitel;

  final double spacing;

  final double iconSize;

  final String? fallbackAsset;

  const InfoRowTheme({
    super.key,
    required this.image,
    required this.text,
    this.trailingText,
    this.suptitel,
    this.spacing = 13.5,
    this.iconSize = 24,
    this.fallbackAsset,
  });

  bool get _isSvg => image.toLowerCase().endsWith('.svg');
  bool get _isNetwork =>
      image.startsWith('http://') || image.startsWith('https://');

  Widget _buildLeading() {
    if (_isSvg) {
      return SvgImageWidget(
        image,
        width: iconSize,
        height: iconSize,
        fallbackAsset: fallbackAsset,
      );
    } else {
      return _isNetwork
          ? Image.network(image, width: iconSize, height: iconSize, fit: BoxFit.contain)
          : Image.asset(image, width: iconSize, height: iconSize, fit: BoxFit.contain);
    }
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = AppTextTheme.bodySmallTextStyle().copyWith(
      color: AppColor.blackColor,
      fontWeight: FontWeight.w400,
    );

    Widget rightSide;
    if (trailingText != null && trailingText!.isNotEmpty) {
      rightSide = RichText(
        textDirection: TextDirection.rtl,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: baseStyle,
          children: [
            TextSpan(text: text),
            const TextSpan(text: ' '),
            TextSpan(text: trailingText),
          ],
        ),
      );
    } else if (suptitel != null) {
      rightSide = DefaultTextStyle.merge(
        style: baseStyle,
        child: suptitel!,
      );
    } else {
      rightSide = AppText(
        text: text,
        appTextTheme: baseStyle,
        textAlign: TextAlign.start,

      );
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLeading(),
          SizedBox(width: spacing),
          Expanded(child: rightSide),
        ],
      ),
    );
  }
}
