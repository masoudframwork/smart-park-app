import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/core/theme/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onMenu;

  const CustomAppBar({
    super.key,
    this.onBack,
    this.onMenu,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _SmallIconButton(
            icon: Icons.arrow_back,
            iconColor: AppColor.primaryColor, // لو بدكها أسود خليه AppColor.blackColor
            onPressed: onBack ?? () => Navigator.of(context).pop(),
          ),
          _SmallIconButton(
            icon: Icons.menu,
            iconColor: AppColor.blackColor,
            onPressed: onMenu ?? () {},
          ),
        ],
      ),
    );
  }
}

class _SmallIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  const _SmallIconButton({
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.r),
      onTap: onPressed,
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: AppColor.contanearGreyColor,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 16.w,
          color: iconColor,
        ),
      ),
    );
  }
}
