import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/widgets/svg_image_widget.dart';
import 'package:smart/features/home/presentation/widgets/parking_card/parking_bottom_sheet.dart';
import 'package:smart/features/home/presentation/widgets/voice_to_text/voice_to_text_screen.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/custome_text_field_widget.dart';
import 'controller/home_controller.dart';
import 'package:smart/features/home/data/models/home_model.dart';
import 'package:smart/features/home/data/models/parking_location.dart';
import 'widgets/parking_details/parking_details_sheet.dart';

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

    return Scaffold(
      body: Stack(
        children: [
          if (homeState.userLocation != null)
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: homeState.userLocation!,
                initialZoom: 15.0,
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
                  FocusScope.of(context).unfocus();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VoiceToTextScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
          if (homeState.selectedMarker == null) const ParkingBottomSheet(),
          if (homeState.selectedMarker != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _ParkingDetailsFloatingWidget(
                parkingLocation: homeState.selectedMarker!,
                onClose: () {
                  ref.read(homeControllerProvider).clearSelection();
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
            AppImages.parkingMarkers,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList();
  }
}

class _ParkingDetailsFloatingWidget extends StatelessWidget {
  final ParkingLocation parkingLocation;
  final VoidCallback onClose;

  const _ParkingDetailsFloatingWidget({
    required this.parkingLocation,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return ParkingDetailsSheet(
      parkingData: parkingLocation,
      onClose: onClose,
      onBookNow: () {},
      onDetails: () {},
    );
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 34.w,
            height: 34.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: AppColor.contanearGreyColor,
                width: 1,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: onMenuTap,
                child: Center(
                  child: Icon(
                    Icons.menu,
                    size: 22.w,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        _SearchBar(
          controller: searchController,
          focusNode: searchFocus,
          hintText: 'ابحث عن موقف',
          trailingIcon: SvgPicture.asset(AppImages.mice),
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
          width: 360.w,
          controller: widget.controller,
          borderRadius: 2.r,
          focusNode: widget.focusNode,
          hintText: widget.hintText,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: widget.onSubmitted,
          onChanged: (_) {},
          readOnly: true,
          enableShadow: true,
          shadowTextFieldColor: AppColor.contanearGreyColor.withOpacity(1.0),
          shadowOffset: const Offset(0, 1),
          shadowBlur: 1,
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
                  tooltip: 'بحث',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
