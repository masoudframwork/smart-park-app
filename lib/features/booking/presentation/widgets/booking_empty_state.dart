import 'package:flutter/material.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';

class BookingEmptyState extends StatelessWidget {
  final int selectedTabIndex;

  const BookingEmptyState({
    super.key,
    required this.selectedTabIndex,
  });

  @override
  Widget build(BuildContext context) {
    final message = selectedTabIndex == 0
        ? 'لا توجد حجوزات حالية'
        : 'لا توجد حجوزات سابقة';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event_busy, size: 80, color: AppColor.greyColor),
          const SizedBox(height: 16),
          AppText(
            text: message,
            appTextTheme: AppTextTheme.titleMediumTextStyle(),
          ),
        ],
      ),
    );
  }
}

class BookingErrorState extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const BookingErrorState({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: errorMessage,
            appTextTheme: AppTextTheme.bodyMediumTextStyle(),
          ),
          const SizedBox(height: 16),
          CustomButtonWidget(
            text: 'إعادة المحاولة',
            onPressed: onRetry,
            width: 200,
          ),
        ],
      ),
    );
  }
}