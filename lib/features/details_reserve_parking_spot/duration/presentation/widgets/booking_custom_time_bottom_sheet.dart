import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../../core/widgets/custom_button.dart';

import '../../../duration/presentation/controller/duration_controller.dart';
import '../../../../../core/widgets/details_reserve_parking_widget/time_range_row.dart';

class BookingCustomTimeBottomSheet extends ConsumerStatefulWidget {
  const BookingCustomTimeBottomSheet({super.key});

  @override
  ConsumerState<BookingCustomTimeBottomSheet> createState() =>
      _BookingCustomTimeBottomSheetState();
}

class _BookingCustomTimeBottomSheetState
    extends ConsumerState<BookingCustomTimeBottomSheet> {
  late TimeOfDay _tmpStart;
  late TimeOfDay _tmpEnd;

  @override
  void initState() {
    super.initState();
    final state = ref.read(durationControllerProvider);
    _tmpStart = state.start;
    _tmpEnd = state.end;
  }

  TimeOfDay _addMinutes(TimeOfDay t, int minutes) {
    final base = DateTime(2000, 1, 1, t.hour, t.minute);
    final res = base.add(Duration(minutes: minutes));
    return TimeOfDay(hour: res.hour, minute: res.minute);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AppBottomSheet(
        maxHeightFactor: 0.33,
        title: 'تحديد مدة الحجز',
        headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TimeRangeRow(
                  start: _tmpStart,
                  end: _tmpEnd,
                  onStartMinus: () =>
                      setState(() => _tmpStart = _addMinutes(_tmpStart, -15)),
                  onStartPlus: () =>
                      setState(() => _tmpStart = _addMinutes(_tmpStart, 15)),
                  onEndMinus: () =>
                      setState(() => _tmpEnd = _addMinutes(_tmpEnd, -15)),
                  onEndPlus: () =>
                      setState(() => _tmpEnd = _addMinutes(_tmpEnd, 15)),
                ),
              ],
            ),
          ],
        ),
        bottomAction: CustomButtonWidget(
          text: 'موافق',
          onPressed: () {
            ref
                .read(durationControllerProvider.notifier)
                .setCustomRange(_tmpStart, _tmpEnd);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
