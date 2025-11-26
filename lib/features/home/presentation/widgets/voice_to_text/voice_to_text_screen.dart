import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custome_text_field_widget.dart';
import '../../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../../core/widgets/divider_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../controller/place_location_search_controller.dart';
import '../../controller/voice_to_text_state.dart';

class VoiceToTextScreen extends ConsumerWidget {
  const VoiceToTextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncResults = ref.watch(placeSearchControllerProvider);
    final controller = ref.read(placeSearchControllerProvider.notifier);

    final voice = ref.watch(placeVoiceUiProvider);
    final isListening = voice.isListening;
    final isAvailable = voice.isAvailable;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.settingsBackgroundColor,
        appBar: CustomAppBar(
          trailing: CloseButtonCircle(onTap: () => Navigator.pop(context)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(17.w),
              child: CustomTextFormField(
                controller: controller.textCtrl,
                hintText: isListening
                    ? S.of(context).search_start_listening
                    : S.of(context).search_for_parking,
                enableShadow: true,
                shadowTextFieldColor:
                    AppColor.contanearGreyColor.withOpacity(0.25),
                shadowOffset: const Offset(0, 8),
                shadowBlur: 12,
                shadowSpread: 0,
                textInputAction: TextInputAction.search,
                readOnly: false,
                onChanged: (val) {
                  controller.setQuery(val);
                  controller.searchWithDebounce();
                },
                onFieldSubmitted: (_) => controller.searchNow(),
                suffixIcon: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: isAvailable ? () => controller.toggleVoice() : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: isListening
                          ? [
                              BoxShadow(
                                color: AppColor.primaryColor.withOpacity(0.35),
                                blurRadius: 16,
                                spreadRadius: 2,
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.searchIcon,
                          width: 16.w,
                          height: 19.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (voice.error != null && voice.error!.isNotEmpty)
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 20.w, end: 20.w, bottom: 6.h),
                child: AppText(
                  text: S.of(context).search_an_error_occurred_try_again,
                  appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                ),
              )
            else if (isListening)
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 20.w, end: 20.w, bottom: 6.h),
                child: AppText(
                  text: S.of(context).search_listening_now_speak,
                  appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                    fontSize: 12,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            Expanded(
              child: asyncResults.when(
                data: (items) {
                  final isSearching =
                      controller.textCtrl.text.trim().isNotEmpty;

                  if (items.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => AppDivider(),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Column(
                        children: [
                          _SearchResultTile(
                            title: item.title,
                            subtitle: item.subtitle,
                            showSubtitle: !isSearching,
                            onTap: () {
                              controller.cancelVoice();
                              controller.textCtrl.text = item.title;
                              controller.setQuery(item.title);
                              controller.searchNow();
                            },
                          ),
                          AppDivider(),
                        ],
                      );
                    },
                  );
                },
                loading: () => Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                ),
                error: (e, _) => Center(
                  child: AppText(
                    text: S.of(context).search_listening_now_speak,
                    appTextTheme: AppTextTheme.titleMediumTextStyle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showSubtitle;
  final VoidCallback? onTap;

  const _SearchResultTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.showSubtitle = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.locationSearchIcon,
              width: 70.w,
              height: 70.h,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    appTextTheme: AppTextTheme.titleMediumTextStyle(),
                  ),
                  if (showSubtitle) ...[
                    SizedBox(height: 4.h),
                    AppText(
                      text: subtitle,
                      appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
