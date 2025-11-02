import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';

class ZoneImageCard extends StatefulWidget {
  const ZoneImageCard({super.key});

  @override
  State<ZoneImageCard> createState() => _ZoneImageCardState();
}

class _ZoneImageCardState extends State<ZoneImageCard> {
  late final PageController _pageController;

  final List<String> _images = [
    AppImages.car1,
    AppImages.car1,
    AppImages.car1,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: AspectRatio(
        aspectRatio: 22 / 8,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              },
            ),
            Positioned(
              bottom: 8.h,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _images.length,
                effect: ExpandingDotsEffect(
                  expansionFactor: 2,
                  spacing: 4.w,
                  radius: 9.r,
                  dotHeight: 8.h,
                  dotWidth: 14.w,
                  activeDotColor: AppColor.whiteColor,
                  dotColor: AppColor.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
