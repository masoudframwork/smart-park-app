import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/theme/app_color.dart' show AppColor;

class CustomImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final Color color;
  final BoxFit fit;
  final Widget? errorWidget;
  final bool isFlag;

  const CustomImageWidget({
    super.key,
    required this.imageUrl,
    this.width = 60,
    this.height = 60,
    this.color = AppColor.blackColor,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.isFlag = false,
  });

  bool get _isSvg => (imageUrl?.toLowerCase().endsWith('.svg') ?? false);

  @override
  Widget build(BuildContext context) {
    if (isFlag) {
      if (_isSvg) {
        return SvgPicture.asset(
          imageUrl ?? 'assets/images/no_image.svg',
          width: width,
          height: height,
          fit: fit,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          placeholderBuilder: (_) => _placeholder(),
        );
      } else {
        return Image.asset(
          imageUrl ?? "assets/images/no_image.jpg",
          width: width,
          height: height,
          fit: fit,
          color: color,
          colorBlendMode: BlendMode.srcIn,
          errorBuilder: (context, error, stackTrace) =>
              errorWidget ??
              Image.asset(
                "assets/images/no_image.jpg",
                fit: fit,
                width: width,
                height: height,
              ),
        );
      }
    } else {
      if (_isSvg) {
        return SvgPicture.network(
          imageUrl ??
              'https://upload.wikimedia.org/wikipedia/commons/6/6b/Bitmap_VS_SVG.svg',
          width: width,
          height: height,
          fit: fit,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          placeholderBuilder: (_) => _placeholder(),
        );
      } else {
        return CachedNetworkImage(
          imageUrl: imageUrl ??
              'https://images.unsplash.com/photo-1584824486509-112e4181ff6b?q=80&w=2940&auto=format&fit=crop',
          width: width,
          height: height,
          fit: fit,
          color: color,
          colorBlendMode: BlendMode.srcIn,
          errorWidget: (context, url, error) =>
              errorWidget ??
              Image.asset(
                "assets/images/no_image.jpg",
                fit: fit,
                width: width,
                height: height,
              ),
          placeholder: (context, url) => _placeholder(),
        );
      }
    }
  }

  Widget _placeholder() => Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
}
