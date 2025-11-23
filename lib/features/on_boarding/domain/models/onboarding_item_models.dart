// class OnboardItem {
//   final String bgImage;
//   final String icon;
//   final String title;
//   final String subtitle;
//
//   const OnboardItem({
//     required this.bgImage,
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//   });
// }
import 'package:flutter/material.dart';

import '../../../../core/constants/image_string.dart';
import '../../../../generated/l10n.dart';

class OnboardingItem {
  final String bgImage;
  final String icon;
  final String title;
  final String subtitle;

  OnboardingItem({
    required this.bgImage,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

List<OnboardingItem> buildOnboardingItems(BuildContext context) {
  return [
    OnboardingItem(
      bgImage: AppImages.intro1,
      icon: AppImages.iconIntro1,
      title: S.of(context).parkyourvehiclewithease,
      subtitle:
          S.of(context).explore_the_map_and_find_the_nearest,
    ),
    OnboardingItem(
      bgImage: AppImages.intro2,
      icon: AppImages.iconIntro2,
      title: S.of(context).no_more_searching_or_hassle,
      subtitle: S.of(context).reserve_your_parking_spot,
    ),
    OnboardingItem(
      bgImage: AppImages.intro3,
      icon: AppImages.iconIntro3,
      title: S.of(context).change_in_plans_no_problem,
      subtitle: S.of(context).extend_your_booking_easily_and_enjoy,
    ),
  ];
}
