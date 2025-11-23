import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../../l10n/app_locale.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usageItems = [
      S.of(context).terms_usage_1,
      S.of(context).terms_usage_2,
      S.of(context).terms_usage_3,
      S.of(context).terms_usage_4,
      S.of(context).terms_usage_5,
    ];

    return ScopedModelDescendant<AppLocale>(
      builder: (context, _, locale) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.settingsBackgroundColor,
            appBar: CustomAppBar(
              backgroundColor: AppColor.backgroundAppBarColor,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              // title: S.of(context).terms_title,
            ),
            body: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  const _TermsHeader(),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildSection(
                          S.of(context).terms_section_1,
                        ),
                        _buildSection(
                          S.of(context).terms_section_2,
                          children: usageItems
                              .map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("• "),
                                        Expanded(
                                            child: AppText(
                                          text: e,
                                          appTextTheme:
                                              AppTextTheme.descriptionTextStyle(),
                                        )),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                        _buildSection(S.of(context).terms_section_3),
                        _buildSection(S.of(context).terms_section_4),
                        _buildSection(S.of(context).terms_section_5),
                        _buildSection(S.of(context).terms_section_6),
                        _buildSection(S.of(context).terms_section_7),
                        _buildSection(S.of(context).terms_section_8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, {List<Widget>? children}) {
    return Container(
      margin: EdgeInsets.only(bottom: 3.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        childrenPadding: EdgeInsets.all(12.w),
        title: Align(
          alignment: Alignment.centerRight,
          child: AppText(
            text: title,
            appTextTheme: AppTextTheme.titleMediumTextStyle(),
          ),
        ),
        children: children ?? [],
      ),
    );
  }
}

class _TermsHeader extends StatelessWidget {
  const _TermsHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        spacing: 15.w,
        children: [
          _ArrowBackButton(
            onTap: () => Navigator.of(context).pop(),
          ),
          AppText(
            text: S.of(context).terms_title,
            appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
              color: AppColor.textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ArrowBackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: CustomImageWidget(
          imageUrl: AppImages.arrowRightIcon,
          width: 20.w,
          height: 20.w,
          isFlag: true,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
