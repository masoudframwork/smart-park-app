
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarSmallPreview extends StatelessWidget {
  final String assetSvg;
  const CarSmallPreview({super.key, required this.assetSvg});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetSvg,
      width: 40,
      height: 24,
    );
  }
}
