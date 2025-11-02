import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/show_change_vehicle_dialog.dart';
import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';
import 'app_text.dart';

enum SheetHeaderStyle {
  centeredTitleWithCloseOnLeft,
  spacedTitleWithCloseOnRight,
}

class AppBottomSheet extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? bottomAction;
  final double maxHeightFactor;
  final SheetHeaderStyle headerStyle;

  const AppBottomSheet({
    super.key,
    required this.title,
    required this.body,
    this.bottomAction,
    this.maxHeightFactor = 0.49,
    this.headerStyle = SheetHeaderStyle.centeredTitleWithCloseOnLeft,
  });

  @override
  Widget build(BuildContext context) {
    final onClose = useBottomSheetCloser(context);

    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeightFactor.sh,
      ),
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
        bottom: 24.h + 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowOpticalColor.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            spacing: 20.h,
            children: [
              _SheetHeader(
                title: title,
                style: headerStyle,
                onCloseTap: onClose,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: body,
                ),
              ),
            ],
          ),
          if (bottomAction != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: bottomAction!,
            ),
        ],
      ),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  final String title;
  final SheetHeaderStyle style;
  final VoidCallback onCloseTap;

  const _SheetHeader({
    required this.title,
    required this.style,
    required this.onCloseTap,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case SheetHeaderStyle.centeredTitleWithCloseOnLeft:
        return SizedBox(
          height: 32.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AppText(
                text: title,
                appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackColor,
                  decoration: TextDecoration.none,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: _CloseButtonCircle(
                  onTap: onCloseTap,
                ),
              ),
            ],
          ),
        );

      case SheetHeaderStyle.spacedTitleWithCloseOnRight:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: title,
              appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
                decoration: TextDecoration.none,
              ),
            ),
            _CloseButtonCircle(
              onTap: onCloseTap,
            ),
          ],
        );
    }
  }
}

class _CloseButtonCircle extends StatelessWidget {
  final VoidCallback onTap;
  const _CloseButtonCircle({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: BoxDecoration(
          color: AppColor.greysCloseColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: AppColor.contanearGreyColor,
            width: 0.8,
          ),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.close,
          size: 15.w,
        ),
      ),
    );
  }
}
