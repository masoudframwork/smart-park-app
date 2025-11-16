import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provider/selected_parking_provider.dart';
import '../../controller/bottom_sheet_controller.dart';
import 'parking_card.dart';

class ParkingBottomSheet extends ConsumerStatefulWidget {
  const ParkingBottomSheet({super.key});

  @override
  ConsumerState<ParkingBottomSheet> createState() => _ParkingBottomSheetState();
}

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
                // THIS IS THE CORRECT PLACE TO USE ref
                ref.read(selectedParkingAreaDetailsProvider.notifier).state = area;

                // hide the bottom sheet
                ref.read(bottomSheetProvider).hide();
              },
            );
          },
        ),
      ),
    );
  }
}
