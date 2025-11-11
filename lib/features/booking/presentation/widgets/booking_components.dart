import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';

class BookingCustomAppBar extends StatelessWidget {
  final bool inDetailsView;
  final VoidCallback onBackToList;
  final VoidCallback onMenu;

  const BookingCustomAppBar({
    super.key,
    required this.inDetailsView,
    required this.onBackToList,
    required this.onMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightBackgroundColor,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16.h,
        right: 16.w,
        left: 16.w,
        bottom: 16.h,
      ),
      child: Row(
        children: [
          _SquareButton(
            onTap: onMenu,
            icon: Icon(
              Icons.menu,
              size: 20.w,
              color: AppColor.blackColor,
            ),
          ),
          SizedBox(width: 12.w),
          if (inDetailsView)
            _SquareButton(
              onTap: onBackToList,
              icon: Image.asset(
                AppImages.arrowIcon,
                width: 16.w,
                height: 16.w,
                color: AppColor.primaryColor,
              ),
            ),
          if (inDetailsView) SizedBox(width: 12.w),
          AppText(
            text: 'الحجوزات',
            appTextTheme: AppTextTheme.titleLargeTextStyle().copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: AppColor.blackNumberSmallColor,
            ),
          ),
        ],
      ),
    );
  }
}

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
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        width: 48.w,
        height: 48.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColor.greyContainerColor,
            width: 1,
          ),
        ),
        child: icon,
      ),
    );
  }
}
