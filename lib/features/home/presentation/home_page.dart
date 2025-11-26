import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/widgets/svg_image_widget.dart';
import 'package:smart/features/home/presentation/widgets/parking_card/parking_bottom_sheet.dart';
import 'package:smart/features/home/presentation/widgets/parking_details_box/green_parking_details.dart';
import 'package:smart/features/home/presentation/widgets/voice_to_text/voice_to_text_screen.dart';
import '../../../core/routing/navigation_service.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/custome_text_field_widget.dart';
import '../../../generated/l10n.dart';
import '../provider/selected_parking_provider.dart';
import 'controller/home_controller.dart';
import 'package:smart/features/home/data/models/home_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final MapController _mapController = MapController();

  final TextEditingController _searchCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeControllerProvider).initializeMap();
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = ref.watch(homeControllerProvider);
    final homeState = homeController.state;
    final selectedParking = ref.watch(selectedParkingAreaDetailsProvider);

    return Scaffold(
      body: Stack(
        children: [
          if (homeState.userLocation != null)
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: homeState.userLocation!,
                initialZoom: 13,
                onTap: (_, __) {
                  ref.read(homeControllerProvider).clearSelection();
                  searchFocus.unfocus();
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.smartpark.app',
                ),
                MarkerLayer(markers: _buildMarkers(homeState)),
                _userLocationMark(homeState),
              ],
            ),

          /// TOP SEARCH BAR – same horizontal padding as cards & nav
          Positioned(
            top: 12.h,
            left: 16.w,
            right: 16.w,
            child: SafeArea(
              bottom: false,
              child: _TopControls(
                searchController: _searchCtrl,
                searchFocus: searchFocus,
                onMenuTap: () {},
                onSearchSubmit: (_) {},
                onSuffixTap: null,
                onSearchTap: () {
                  NavigationService.push('/voiceToTextScreen');
                  // FocusScope.of(context).unfocus();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const VoiceToTextScreen(),
                  //   ),
                  // );
                },
              ),
            ),
          ),

          /// BOTTOM SHEET – will contain the white card + bottom nav
          if (homeState.selectedMarker == null)
            ParkingBottomSheet(
              mapController: _mapController,
            ),

          /// GREEN CARD – same horizontal 16.w margins as design
          if (selectedParking != null)
            Positioned(
              top: 160.h, // tune this value to match XD
              left: 16.w,
              right: 16.w,
              child: GreenParkingDetails(
                parkingArea: selectedParking,
                onClose: () {
                  ref.read(selectedParkingAreaDetailsProvider.notifier).state =
                      null;
                },
              ),
            ),
        ],
      ),
    );
  }

  MarkerLayer _userLocationMark(HomeModel homeModel) {
    return MarkerLayer(
      markers: [
        Marker(
          point: homeModel.userLocation!,
          width: 40.w,
          height: 40.h,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 3),
            ),
            child: Center(
              child: Container(
                width: 12.w,
                height: 12.h,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Marker> _buildMarkers(HomeModel homeModel) {
    return homeModel.locations.asMap().entries.map((entry) {
      final index = entry.key;
      final location = entry.value;

      return Marker(
        point: LatLng(location.lat, location.lng),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            ref.read(homeControllerProvider).selectMarker(location, index);
          },
          child: SvgImageWidget(
            AppImages.locationSearchIcon,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList();
  }
}

class _TopControls extends StatelessWidget {
  const _TopControls({
    required this.searchController,
    required this.searchFocus,
    required this.onMenuTap,
    required this.onSearchSubmit,
    this.onSuffixTap,
    required this.onSearchTap,
  });

  final TextEditingController searchController;
  final FocusNode searchFocus;
  final VoidCallback onMenuTap;
  final ValueChanged<String> onSearchSubmit;
  final VoidCallback? onSuffixTap;
  final VoidCallback onSearchTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        _SearchBar(
          controller: searchController,
          focusNode: searchFocus,
          hintText: S.of(context).searchParkingHint,
          trailingIcon: SvgPicture.asset(AppImages.searchIcon),
          onSubmitted: onSearchSubmit,
          onSuffixTap: onSuffixTap,
          onTap: onSearchTap,
        ),
      ],
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.leadingIcon,
    this.trailingIcon,
    this.onSubmitted,
    this.onSuffixTap,
    this.onClearTap,
    this.onTap,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onClearTap;
  final VoidCallback? onTap;

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChange);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChange);
    super.dispose();
  }

  void _onTextChange() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: IgnorePointer(
        ignoring: true,
        child: CustomTextFormField(
          // IMPORTANT: remove hardcoded 360.w to respect left/right = 16
          width: double.infinity,
          controller: widget.controller,
          borderRadius: 12.r,
          focusNode: widget.focusNode,
          hintText: widget.hintText,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: widget.onSubmitted,
          onChanged: (_) {},
          borderSideColor: AppColor.greyDividerColor,
          readOnly: true,
          enableShadow: true,
          shadowTextFieldColor: AppColor.contanearGreyColor.withOpacity(1.0),
          shadowOffset: const Offset(0, 1),
          //  shadowBlur: 1,
          shadowSpread: 1,
          prefixIcon: widget.leadingIcon != null
              ? Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.w, end: 6.w),
                  child: widget.leadingIcon!,
                )
              : null,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.trailingIcon != null)
                IconButton(
                  onPressed: widget.onSuffixTap,
                  icon: widget.trailingIcon!,
                  tooltip: S.of(context).searchTooltip,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
