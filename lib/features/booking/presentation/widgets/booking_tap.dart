import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class BookingTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const BookingTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: _buildTab(
              title: 'الحجوزات الحالية',
              isSelected: selectedIndex == 0,
              onTap: () => onTabChanged(0),
            ),
          ),
          Expanded(
            child: _buildTab(
              title: 'الحجوزات السابقة',
              isSelected: selectedIndex == 1,
              onTap: () => onTabChanged(1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 38.h,
            alignment: Alignment.center,
            child: AppText(
              text: title,
              appTextTheme: AppTextTheme.font18SimiBoldBlack(),
            ),
          ),
          SizedBox(
            height: 3.h,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColor.greyContainerColor,
                ),
                if (isSelected)
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Container(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
