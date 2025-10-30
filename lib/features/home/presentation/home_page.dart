import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller/home_controller.dart';
import 'widgets/marker_info_card.dart';

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
      ref.read(homeControllerProvider.notifier).initializeMap();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeControllerProvider);

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
                  ref.read(homeControllerProvider.notifier).clearSelection();
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.smartpark.app',
                ),
                
                MarkerLayer(
                  markers: _buildMarkers(homeState),
                ),
                
                MarkerLayer(
                  markers: [
                    Marker(
                      point: homeState.userLocation!,
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
                ),
              ],
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Text(
                      'Error: ${homeState.error}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
                onNavigate: () => _handleMarkerAction(homeState.selectedMarker!),
                onDetails: () => _handleMarkerAction(homeState.selectedMarker!),
              ),
            ),

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

  List<Marker> _buildMarkers(HomeState homeState) {
    return homeState.locations.asMap().entries.map((entry) {
      final index = entry.key;
      final location = entry.value;
      final isSelected = homeState.selectedMarkerIndex == index;

      return Marker(
        point: LatLng(location['lat'], location['lng']),
        width: isSelected ? 50.w : 40.w,
        height: isSelected ? 50.h : 40.h,
        child: GestureDetector(
          onTap: () {
            ref.read(homeControllerProvider.notifier).selectMarker(location, index);
          },
          child: Container(
            decoration: BoxDecoration(
              color: _getMarkerColor(location['type']),
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.white : Colors.transparent,
                width: 3.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 4.r,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              _getMarkerIcon(location['type']),
              color: Colors.white,
              size: isSelected ? 24.sp : 20.sp,
            ),
          ),
        ),
      );
    }).toList();
  }

  IconData _getMarkerIcon(String type) {
    switch (type) {
      case 'parking':
        return Icons.local_parking;
      case 'charging':
        return Icons.electric_car;
      case 'service':
        return Icons.build;
      default:
        return Icons.place;
    }
  }

  Color _getMarkerColor(String type) {
    switch (type) {
      case 'parking':
        return Colors.blue;
      case 'charging':
        return Colors.green;
      case 'service':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  void _handleMarkerAction(Map<String, dynamic> marker) {
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
    if (homeState.userLocation != null) {
      _mapController.move(homeState.userLocation!, 15.0);
    }
  }
}