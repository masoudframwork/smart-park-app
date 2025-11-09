import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/details_reserve_parking_widget/time_range_row.dart';
import '../controller/booking_summary.dart';

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
    final state = ref.read(bookingSummaryControllerProvider);
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
    final controller = ref.read(bookingSummaryControllerProvider.notifier);

    return Material(
      color: Colors.transparent,
      child: AppBottomSheet(
        maxHeightFactor: 0.30,
        title: 'تحديد مدة الحجز',
        headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
        body: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeRangeRow(
                  start: _tmpStart,
                  end: _tmpEnd,
                  onStartMinus: () => setState(() {
                    _tmpStart = _addMinutes(_tmpStart, -15);
                  }),
                  onStartPlus: () => setState(() {
                    _tmpStart = _addMinutes(_tmpStart, 15);
                  }),
                  onEndMinus: () => setState(() {
                    _tmpEnd = _addMinutes(_tmpEnd, -15);
                  }),
                  onEndPlus: () => setState(() {
                    _tmpEnd = _addMinutes(_tmpEnd, 15);
                  }),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            CustomButtonWidget(
              text: 'موافق',
              onPressed: () {
                controller.setCustomRange(_tmpStart, _tmpEnd);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
