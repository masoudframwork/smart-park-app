import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller/home_controller.dart';
import 'widgets/marker_info_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    // Initialize the map when the widget is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeControllerProvider.notifier).initializeMap();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          if (homeState.userLocation != null)
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: homeState.userLocation!,
                zoom: 15.0,
              ),
              markers: homeState.markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
              zoomControlsEnabled: true,
              onTap: (LatLng position) {
                // Clear selection when tapping on empty area
                ref.read(homeControllerProvider.notifier).clearSelection();
              },
            )
          else if (homeState.isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else if (homeState.error != null)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64.sp,
                    color: Colors.red,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Error: ${homeState.error}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(homeControllerProvider.notifier).initializeMap();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),

          // Selected marker info card
          if (homeState.selectedMarker != null)
            Positioned(
              bottom: 20.h,
              left: 16.w,
              right: 16.w,
              child: MarkerInfoCard(
                marker: homeState.selectedMarker!,
                onClose: () {
                  ref.read(homeControllerProvider.notifier).clearSelection();
                },
                onNavigate: () =>
                    _handleMarkerAction(homeState.selectedMarker!),
                onDetails: () => _handleMarkerAction(homeState.selectedMarker!),
              ),
            ),

          // Floating action button for custom actions
          Positioned(
            top: 50.h,
            right: 16.w,
            child: FloatingActionButton(
              onPressed: () {
                _showCustomActionsDialog(context);
              },
              child: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }

  void _handleMarkerAction(Map<String, dynamic> marker) {
    // Handle the action when user taps on marker buttons
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Action for ${marker['title']}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showCustomActionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Map Actions'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.my_location),
              title: const Text('Go to My Location'),
              onTap: () {
                _goToUserLocation();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Refresh Markers'),
              onTap: () {
                ref.read(homeControllerProvider.notifier).initializeMap();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.clear),
              title: const Text('Clear Selection'),
              onTap: () {
                ref.read(homeControllerProvider.notifier).clearSelection();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _goToUserLocation() {
    final homeState = ref.read(homeControllerProvider);
    if (homeState.userLocation != null && _mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLng(homeState.userLocation!),
      );
    }
  }
}
