import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import '../../../provider/selected_parking_provider.dart';
import '../../controller/bottom_sheet_controller.dart';
import '../../controller/home_controller.dart';
import 'parking_card.dart';

class ParkingBottomSheet extends ConsumerStatefulWidget {
  final MapController mapController;

  const ParkingBottomSheet({
    super.key,
    required this.mapController,
  });

  @override
  ConsumerState<ParkingBottomSheet> createState() => _ParkingBottomSheetState();
}

// ⭐ Recommended Zoom Level
// 13 = city level
// 14 = street level
// 16 = close parking-level zoom (best for your UI)

class _ParkingBottomSheetState extends ConsumerState<ParkingBottomSheet> {
  late ScrollController _scrollCtrl;

  @override
  void initState() {
    super.initState();
    _scrollCtrl = ScrollController();
    _scrollCtrl.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollCtrl.dispose();
  }

  void _onScroll() {
    if (!_scrollCtrl.hasClients) return;

    final offset = _scrollCtrl.offset;

    const cardWidth = 332.0;
    const spacing = 20.0;
    final itemExtent = cardWidth + spacing;

    int index = (offset / itemExtent).round();

    final parkingAreas = ref.read(bottomSheetProvider).parkingAreas;

    if (index < 0 || index >= parkingAreas.length) return;

    final selectedArea = parkingAreas[index];

    // ⭐ FIX — Wait until the map is fully rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      try {
        widget.mapController.move(
          LatLng(selectedArea.latitude, selectedArea.longitude),
          17.0,
        );
      } catch (e) {
        print("MAP NOT READY YET — delaying...");
      }
    });

    // Update selected card
    ref.read(selectedParkingAreaDetailsProvider.notifier).state = selectedArea;
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(bottomSheetProvider);
    final parkingAreas = controller.parkingAreas;
    final selectedParking = ref.watch(selectedParkingAreaDetailsProvider);

    if (parkingAreas.isEmpty) {
      return const SizedBox.shrink();
    }

    return Positioned(
      left: 0,
      right: 0,
      bottom: 50,
      child: SizedBox(
        height: 150.h,
        child: ListView.separated(
          controller: _scrollCtrl,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          scrollDirection: Axis.horizontal,
          itemCount: parkingAreas.length,
          separatorBuilder: (_, __) => SizedBox(width: 16.w),
          itemBuilder: (context, i) {
            final area = parkingAreas[i];

            return ParkingCard(
              parkingArea: area,
              onTap: () {
                final homeState = ref.read(homeControllerProvider).state;

                // 1️⃣ Find the matching map marker from homeState.locations
                final matchingLocation = homeState.locations.firstWhere(
                  (loc) =>
                      (loc.code == area.code) || // best match
                      (loc.lat == area.latitude) || // alternative match
                      (loc.lng == area.longitude), // alternative match
                  orElse: () => homeState.locations.first,
                );

                // 2️⃣ Save selected card
                ref.read(selectedParkingAreaDetailsProvider.notifier).state =
                    area;

                // 3️⃣ Hide sheet
                ref.read(bottomSheetProvider).hide();

                // 4️⃣ Animate map to the ACTUAL marker position
                widget.mapController.move(
                  LatLng(matchingLocation.lat, matchingLocation.lng),
                  17.0, // 👈 SET ZOOM LEVEL FOR PARKING SELECTION
                );

                print("Selected area: ${area.latitude}, ${area.longitude}");
                print(
                    "Marker location: ${matchingLocation.lat}, ${matchingLocation.lng}");
              },
            );
          },
        ),
      ),
    );
  }
}
