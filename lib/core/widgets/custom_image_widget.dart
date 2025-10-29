import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smart_park_app/core/theme/app_color.dart' show AppColor;

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

  @override
  Widget build(BuildContext context) {
    if (isFlag) {
      return Image.asset(
        imageUrl ?? "assets/images/no_image.jpg",
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ??
            Image.asset(
              "assets/images/no_image.jpg",
              fit: fit,
              width: width,
              height: height,
            ),
      );
    } else {
      return CachedNetworkImage(
        imageUrl:
            imageUrl ??
            'https://images.unsplash.com/photo-1584824486509-112e4181ff6b?q=80&w=2940&auto=format&fit=crop',
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorWidget: (context, url, error) =>
            errorWidget ??
            Image.asset(
              "assets/images/no_image.jpg",
              fit: fit,
              width: width,
              height: height,
            ),
        placeholder: (context, url) => Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }
  }
}
