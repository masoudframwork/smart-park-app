import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/widgets/svg_image_widget.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeControllerProvider).initializeMap();
    });
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
    // Convert ParkingLocation to Map for ParkingDetailsSheet

    return ParkingDetailsSheet(
      parkingData: parkingLocation,
      onClose: onClose,
      onBookNow: () {
        // Handle booking action
      },
      onDetails: () {
        // Handle details action
      },
    );
  }
}
