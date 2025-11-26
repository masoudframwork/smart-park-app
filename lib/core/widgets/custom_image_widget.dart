import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/theme/app_color.dart' show AppColor;

class CustomImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final Color? color;
  final BoxFit fit;
  final Widget? errorWidget;
  final bool isFlag;

  const CustomImageWidget({
    super.key,
    required this.imageUrl,
    this.width = 60,
    this.height = 60,
    this.color,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.isFlag = false,
  });

  bool get _isSvg => (imageUrl?.toLowerCase().endsWith('.svg') ?? false);

  @override
  Widget build(BuildContext context) {
    // Safe default color
    final safeColor = color ?? Colors.black;

    if (imageUrl == null || imageUrl!.isEmpty) {
      return _placeholder();
    }

    if (isFlag) {
      // -----------------------
      // LOAD FROM ASSETS (icons)
      // -----------------------
      if (_isSvg) {
        return SvgPicture.asset(
          imageUrl!,
          width: width,
          height: height,
          fit: fit,
          colorFilter: ColorFilter.mode(safeColor, BlendMode.srcIn),
          placeholderBuilder: (_) => _placeholder(),
        );
      } else {
        return Image.asset(
          imageUrl!,
          width: width,
          height: height,
          fit: fit,
          color: color,
          colorBlendMode: color != null ? BlendMode.srcIn : null,
          errorBuilder: (_, __, ___) =>
              errorWidget ?? Image.asset("assets/images/no_image.jpg"),
        );
      }
    }

    // -----------------------------------------
    // NETWORK IMAGE (with SVG or normal image)
    // -----------------------------------------
    if (_isSvg) {
      return SvgPicture.network(
        imageUrl!,
        width: width,
        height: height,
        fit: fit,
        colorFilter: ColorFilter.mode(safeColor, BlendMode.srcIn),
        placeholderBuilder: (_) => _placeholder(),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: color != null ? BlendMode.srcIn : null,
      placeholder: (_, __) => _placeholder(),
      errorWidget: (_, __, ___) =>
          errorWidget ??
          Image.asset(
            "assets/images/no_image.jpg",
            width: width,
            height: height,
            fit: fit,
          ),
    );
  }

  Widget _placeholder() => Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
}
