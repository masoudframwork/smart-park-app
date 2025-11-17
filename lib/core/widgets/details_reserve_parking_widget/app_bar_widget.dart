import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_color.dart';

class SquareButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final double size;
  final Color? backgroundColor;
  final Color? borderColor;

  const SquareButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.size = 34,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: size.w,
        height: size.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: borderColor ?? AppColor.contanearGreyColor,
            width: 1,
          ),
        ),
        child: icon,
      ),
    );
  }
}

class CloseButtonCircle extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  const CloseButtonCircle({super.key, required this.onTap, this.size = 31});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: size.w,
        height: size.w,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.close,
          size: (size * 0.58).w,
          color: AppColor.blackColor,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? center;
  final Widget? trailing;

  final double sideSlotSize;

  const CustomAppBar({
    super.key,
    this.leading,
    this.center,
    this.trailing,
    this.sideSlotSize = 34,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final leftSlot =
        leading ?? SizedBox(width: sideSlotSize.w, height: sideSlotSize.w);
    final rightSlot =
        trailing ?? SizedBox(width: sideSlotSize.w, height: sideSlotSize.w);

    return Container(
      height: preferredSize.height,
      color: AppColor.whiteBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          leftSlot,

          Expanded(
            child: Center(child: center ?? const SizedBox.shrink()),
          ),

          // Trailing
          rightSlot,
        ],
      ),
    );
  }
}
