import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/features/profile/presentation/widget/electronic_payment_cards.dart'
    show ElectronicPaymentCards;
import 'package:smart/features/profile/presentation/widget/pre_preserved_vehicles.dart';
import '../../../core/routing/navigation_service.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../settings/presentation/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.settingsBackgroundColor,
        appBar: CustomAppBar(
          backgroundColor: AppColor.backgroundAppBarColor,
          leading: CircleImageButton(
            onTap: () {},
            imageUrl: AppImages.appLogo,
            size: 37,
          ),
        ),
        body: const Directionality(
          textDirection: TextDirection.rtl,
          child: _ProfileBody(),
        ),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _ProfileHeaderCard(),
          const SizedBox(height: 24),
          const _SectionTitle(text: 'بيانات اضافية'),
          const SizedBox(height: 12),
          _AdditionalInfoTile(
            title: 'المخالفات',
            hint: 'قريباً',
            icon: SvgPicture.asset(
              AppImages.userProfileWallet,
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(height: 12),
          _AdditionalInfoTile(
            title: 'المحفظة',
            hint: 'قريباً',
            icon: SvgPicture.asset(
              AppImages.userProfileWallet,
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(height: 24),
          const _SectionTitle(text: 'المعلومات المحفوظة مسبقاً'),
          const SizedBox(height: 12),
          _StoredInfoTile(
            title: 'المركبات',
            icon: SvgPicture.asset(
              AppImages.userProfileCarLeft,
              width: 20,
              height: 20,
            ),
            // icon: Icons.directions_car,
            onTap: () {
              final container =
                  ProviderScope.containerOf(context, listen: false);
              // container
              //     .read(bottomNavBarController)
              //     .changeIndex(BottomNavBarController.profileIndex);

              //NavigationService.push('/prePreservedVehicles');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PrePreservedVehicles(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _StoredInfoTile(
            title: 'بطاقات الدفع الالكتروني',
            icon: SvgPicture.asset(
              AppImages.userProfileElectronicPayment,
              width: 20,
              height: 20,
            ),
            showStatusDot: true,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ElectronicPaymentCards(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _StoredInfoTile(
            title: 'الإعدادات',
            icon: SvgPicture.asset(
              AppImages.userProfileWallet,
              width: 20,
              height: 20,
            ),
            onTap: () {
              //  NavigationService.push('/settingsScreen');

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          const _LogoutButton(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _ProfileHeaderCard extends StatelessWidget {
  const _ProfileHeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _ProfileHeaderTop(),
          const Divider(height: 0, thickness: 0.0),
          const _ProfileDetails(),
          const SizedBox(height: 16),
          const _NafathButton(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _ProfileHeaderTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 77.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColor.textColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 33,
            height: 33,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.person,
              size: 20,
              color: AppColor.textColor,
            ),
          ),
          const SizedBox(width: 12),
          AppText(
            text: 'عبد الرحمن أحمد عبدالله',
            appTextTheme: AppTextTheme.secondaryButtonTextStyle().copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.verified,
            size: 25,
            color: AppColor.whiteColor,
          ),
        ],
      ),
    );
  }
}

class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _ProfileDetailItem(
            label: 'رقم الهاتف',
            value: '+966 11 234 5678',
          ),
          SizedBox(height: 12),
          Divider(height: 0),
          SizedBox(height: 12),
          _ProfileDetailItem(
            label: 'تاريخ الميلاد',
            value: '1998/5/12',
          ),
          SizedBox(height: 12),
          Divider(height: 0),
          SizedBox(height: 12),
          _ProfileDetailItem(
            label: 'العنوان الوطني',
            value: 'ABCD1234',
          ),
        ],
      ),
    );
  }
}

class _ProfileDetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileDetailItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: label,
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            color: AppColor.blackColor,
          ),
        ),
        const SizedBox(height: 4),
        Directionality(
          textDirection: TextDirection.ltr,
          child: AppText(
            text: value,
            appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
              color: AppColor.blackColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}

class _NafathButton extends StatelessWidget {
  const _NafathButton();

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      backgroundColor: AppColor.primaryCard,
      text: 'الربط مع نفاذ',
      width: 315,
      onPressed: () {
        NavigationService.push(
          '/nafathPageLogin',
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppText(
        text: text,
        appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
          fontWeight: FontWeight.w500,
          color: AppColor.textColor,
        ),
      ),
    );
  }
}

class _AdditionalTileContainer extends StatelessWidget {
  final Widget child;

  const _AdditionalTileContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColor.greyDividerColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _AdditionalInfoTile extends StatelessWidget {
  final String title;
  final String hint;
  final Widget icon;

  const _AdditionalInfoTile({
    required this.title,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return _AdditionalTileContainer(
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: icon,
          ),
          const SizedBox(width: 8),
          AppText(
            text: title,
            appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
              color: Colors.grey.shade400,
            ),
          ),
          const Spacer(),
          AppText(
            text: hint,
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}

class _StoredInfoTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool showStatusDot;
  final VoidCallback? onTap;

  const _StoredInfoTile({
    required this.title,
    required this.icon,
    this.showStatusDot = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: _ProfileTileContainer(
        child: Row(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: icon,
            ),
            const SizedBox(width: 8),
            AppText(
              text: title,
              appTextTheme: AppTextTheme.titleMediumTextStyle(),
            ),
            const Spacer(),
            if (showStatusDot)
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      backgroundColor: AppColor.logOutCard,
      text: 'تسجيل الخروج',
      width: 315,
      borderRadius: 10.r,
      iconLayout: ButtonIconLayout.center,
      icon: const Icon(
        Icons.power_settings_new,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }
}

class _ProfileTileContainer extends StatelessWidget {
  final Widget child;

  const _ProfileTileContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColor.greyDividerColor,
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
