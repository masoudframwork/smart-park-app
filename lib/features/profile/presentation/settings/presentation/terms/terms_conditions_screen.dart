import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../../../../core/constants/image_string.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/arrow_widget_custom_bar.dart';
import '../../../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../l10n/app_locale.dart';

class TermsScreen extends StatelessWidget {
  final TextStyle? sectionTitleTextStyle;
  final TextStyle? sectionBodyTextStyle;
  final TextStyle? bulletSymbolTextStyle;
  final TextStyle? usageIntroTextStyle;

  const TermsScreen({
    super.key,
    this.sectionTitleTextStyle,
    this.sectionBodyTextStyle,
    this.bulletSymbolTextStyle,
    this.usageIntroTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppLocale>(
      builder: (context, _, locale) {
        final isArabic = locale.isArabic();
        final sections = _buildSections(
          context: context,
          isArabic: isArabic,
        );

        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.settingsBackgroundColor,
            appBar: CustomAppBar(
              backgroundColor: AppColor.backgroundAppBarColor,
              leading: CircleImageButton(
                imageUrl: AppImages.appLogo,
                size: 37,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(17.w),
              child: Column(
                children: [
                  ArrowWidgetCustomBar(
                    onTap: () => Navigator.of(context).pop(),
                    title: S.of(context).terms_title,
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: _TermsCard(
                        sections: sections,
                        isArabic: isArabic,
                        sectionTitleTextStyle: sectionTitleTextStyle,
                      ),
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

  /// يبني لستة الـ sections مع العناوين والمحتوى
  List<_TermsSectionConfig> _buildSections({
    required BuildContext context,
    required bool isArabic,
  }) {
    final usageItems = [
      S.of(context).terms_usage_1,
      S.of(context).terms_usage_2,
      S.of(context).terms_usage_3,
      S.of(context).terms_usage_4,
      S.of(context).terms_usage_5,
    ];

    return [
      _TermsSectionConfig(
        title: S.of(context).terms_section_1,
      ),
      _TermsSectionConfig(
        title: S.of(context).terms_section_2,
        children: [
          _UsageSectionContent(
            isArabic: isArabic,
            usageIntroText: S.of(context).terms_usage_0,
            usageItems: usageItems,
            usageIntroTextStyle: usageIntroTextStyle,
            sectionBodyTextStyle: sectionBodyTextStyle,
            bulletSymbolTextStyle: bulletSymbolTextStyle,
          ),
        ],
      ),
      _TermsSectionConfig(
        title: S.of(context).terms_section_3,
      ),
      _TermsSectionConfig(
        title: S.of(context).terms_section_4,
      ),
      _TermsSectionConfig(
        title: S.of(context).terms_section_5,
      ),
      _TermsSectionConfig(
        title: S.of(context).terms_section_6,
      ),
      _TermsSectionConfig(
        title: S.of(context).terms_section_7,
      ),
      _TermsSectionConfig(
        title: S.of(context).terms_section_8,
      ),
    ];
  }
}

class _TermsSectionConfig {
  final String title;
  final List<Widget> children;

  const _TermsSectionConfig({
    required this.title,
    this.children = const [],
  });

  bool get hasChildren => children.isNotEmpty;
}

class _TermsCard extends StatelessWidget {
  final List<_TermsSectionConfig> sections;
  final bool isArabic;
  final TextStyle? sectionTitleTextStyle;

  const _TermsCard({
    required this.sections,
    required this.isArabic,
    this.sectionTitleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColor.greyDividerColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(sections.length, (index) {
            final section = sections[index];
            final isLast = index == sections.length - 1;
            return _TermsSectionTile(
              title: section.title,
              isArabic: isArabic,
              isLast: isLast,
              sectionTitleTextStyle: sectionTitleTextStyle,
              children: section.children,
            );
          }),
        ),
      ),
    );
  }
}

class _TermsSectionTile extends StatelessWidget {
  final String title;
  final bool isArabic;
  final bool isLast;
  final TextStyle? sectionTitleTextStyle;
  final List<Widget> children;

  const _TermsSectionTile({
    required this.title,
    required this.isArabic,
    required this.isLast,
    required this.children,
    this.sectionTitleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    const dividerColor = AppColor.greyDividerColor;

    final EdgeInsets tilePadding = EdgeInsets.symmetric(
      horizontal: 16.w,
      vertical: 2.h,
    );

    final EdgeInsets childrenPadding = EdgeInsets.fromLTRB(
      16.w,
      0,
      16.w,
      4.h,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: ExpansionTile(
            tilePadding: tilePadding,
            childrenPadding: childrenPadding,
            backgroundColor: AppColor.whiteColor,
            collapsedBackgroundColor: AppColor.whiteColor,
            iconColor: AppColor.blackSubColor,
            collapsedIconColor: AppColor.blackSubColor,
            textColor: AppColor.blackSubColor,
            collapsedTextColor: AppColor.blackSubColor,
            title: Align(
              alignment:
                  isArabic ? Alignment.centerRight : Alignment.centerLeft,
              child: AppText(
                text: title,
                appTextTheme: sectionTitleTextStyle ??
                    AppTextTheme.titleMediumTextStyle().copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            children: children,
          ),
        ),
        if (!isLast)
          Container(
            height: 1,
            color: dividerColor,
          ),
      ],
    );
  }
}

class _UsageSectionContent extends StatelessWidget {
  final bool isArabic;
  final String usageIntroText;
  final List<String> usageItems;
  final TextStyle? usageIntroTextStyle;
  final TextStyle? sectionBodyTextStyle;
  final TextStyle? bulletSymbolTextStyle;

  const _UsageSectionContent({
    required this.isArabic,
    required this.usageIntroText,
    required this.usageItems,
    this.usageIntroTextStyle,
    this.sectionBodyTextStyle,
    this.bulletSymbolTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Row(
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: AppText(
                  text: usageIntroText,
                  appTextTheme: usageIntroTextStyle ??
                      AppTextTheme.timeTextStyle().copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),

        // العناصر بالنقاط
        ...usageItems.map(
          (e) => _BulletRow(
            isArabic: isArabic,
            text: e,
            bulletStyle: bulletSymbolTextStyle,
            textStyle: sectionBodyTextStyle,
          ),
        ),
      ],
    );
  }
}

class _BulletRow extends StatelessWidget {
  final bool isArabic;
  final String text;
  final TextStyle? bulletStyle;
  final TextStyle? textStyle;

  const _BulletRow({
    required this.isArabic,
    required this.text,
    this.bulletStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Text(
            '• ',
            style: bulletStyle ?? TextStyle(fontSize: 20.sp),
          ),
          Expanded(
            child: AppText(
              text: text,
              appTextTheme: textStyle ??
                  AppTextTheme.timeTextStyle().copyWith(
                    fontWeight: FontWeight.w300,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
