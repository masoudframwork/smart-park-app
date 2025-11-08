// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../constants/image_string.dart';
// import '../../theme/app_color.dart';
//
// class _SquareButton extends StatelessWidget {
//   final VoidCallback onTap;
//   final Widget icon;
//
//   const _SquareButton({
//     required this.onTap,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(10.r),
//       child: Container(
//         width: 34.w,
//         height: 34.w,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: AppColor.whiteColor,
//           borderRadius: BorderRadius.circular(10.r),
//           border: Border.all(
//             color: AppColor.contanearGreyColor,
//             width: 1,
//           ),
//         ),
//         child: icon,
//       ),
//     );
//   }
// }
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final VoidCallback? onBack;
//   final VoidCallback? onMenu;
//
//   const CustomAppBar({
//     super.key,
//     this.onBack,
//     this.onMenu,
//   });
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: preferredSize.height,
//       color: AppColor.whiteColor,
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _SquareButton(
//             onTap: onBack ?? () => Navigator.of(context).pop(),
//             icon: Image.asset(
//               AppImages.arrowRightIcon,
//               width: 20.w,
//               height: 20.w,
//               color: AppColor.primaryColor,
//             ),
//           ),
//           _SquareButton(
//             onTap: onMenu ?? () {},
//             icon: Icon(
//               Icons.menu,
//               size: 22.w,
//               color: AppColor.blackColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/image_string.dart';
import '../../theme/app_color.dart';

enum AppBarLeading { back, close, none }

class _SquareButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;

  const _SquareButton({
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: 34.w,
        height: 34.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColor.contanearGreyColor,
            width: 1,
          ),
        ),
        child: icon,
      ),
    );
  }
}

class _CircleCloseButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CircleCloseButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 31.w,
        height: 31.w,
        decoration: BoxDecoration(
          color: AppColor.greysCloseColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.close,
          size: 18.w,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarLeading leadingType;
  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final VoidCallback? onMenu;

  const CustomAppBar({
    super.key,
    this.leadingType = AppBarLeading.back,
    this.onBack,
    this.onClose,
    this.onMenu,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget? _buildLeading(BuildContext context) {
    switch (leadingType) {
      case AppBarLeading.back:
        return _SquareButton(
          onTap: onBack ?? () => Navigator.of(context).pop(),
          icon: Image.asset(
            AppImages.arrowRightIcon,
            width: 20.w,
            height: 20.w,
            color: AppColor.primaryColor,
          ),
        );
      case AppBarLeading.close:
        return _CircleCloseButton(
          onTap: onClose ?? () => Navigator.of(context).pop(),
        );
      case AppBarLeading.none:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final leading = _buildLeading(context);

    return Container(
      height: preferredSize.height,
      color: AppColor.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ?? SizedBox(width: 34.w, height: 34.w),
          const SizedBox(width: 8),
          _SquareButton(
            onTap: onMenu ?? () {},
            icon: Icon(
              Icons.menu,
              size: 22.w,
              color: AppColor.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
