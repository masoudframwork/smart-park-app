import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import '../../../provider/selected_parking_provider.dart';
import '../../controller/bottom_sheet_controller.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          scrollDirection: Axis.horizontal,
          itemCount: parkingAreas.length,
          separatorBuilder: (_, __) => SizedBox(width: 16.w),
          itemBuilder: (context, i) {
            final area = parkingAreas[i];

            return ParkingCard(
              parkingArea: area,
              onTap: () {
                // 1️⃣ Save selected parking area
                ref.read(selectedParkingAreaDetailsProvider.notifier).state =
                    area;

                // 2️⃣ Hide bottom sheet
                ref.read(bottomSheetProvider).hide();

                // 3️⃣ Animate map to the marker
                widget.mapController.move(
                  LatLng(area.latitude, area.longitude),
                  16.0, // ⬅️ ZOOM LEVEL (try 14–17)
                );
              },
            );
          },
        ),
      ),
    );
  }
}
