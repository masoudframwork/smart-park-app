import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_color.dart';

class BookingDetailAppBar extends StatelessWidget {
  const BookingDetailAppBar({super.key});

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
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
              child: Icon(
                Icons.menu,
                size: 20.w,
                color: AppColor.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}