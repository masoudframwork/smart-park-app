import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/booking/presentation/widgets/booking_list_view.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../core/constants/image_string.dart';
import '../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../base/base_screen.dart';

class BookingPage extends ConsumerWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScreen(
      backgroundColor: AppColor.settingsBackgroundColor,
      appBar: CustomAppBar(
        backgroundColor: AppColor.backgroundAppBarColor,
        leading: CircleImageButton(
          onTap: () {},
          imageUrl: AppImages.appLogo,
          size: 37,
        ),
      ),
      body: Directionality(
        textDirection: Directionality.of(context),
        child: const BookingListView(),
      ),
    );
  }
}

