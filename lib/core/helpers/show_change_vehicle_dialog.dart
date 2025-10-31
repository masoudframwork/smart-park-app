import 'package:flutter/material.dart';

import '../../features/details_reserve_parking_spot/booking_summary/presentation/widget/change_payment_method_bottom_sheet.dart';
import '../../features/details_reserve_parking_spot/booking_summary/presentation/widget/change_vehicle_dialog_widget.dart';

void showAppBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return child;
    },
  );
}

/// دالة للمركبة
void showChangeVehicleBottomSheet(BuildContext context) {
  showAppBottomSheet(
    context: context,
    child: const ChangeVehicleBottomSheet(),
  );
}

/// دالة لطريقة الدفع
void showChangePaymentMethodBottomSheet(BuildContext context) {
  showAppBottomSheet(
    context: context,
    child: const ChangePaymentMethodBottomSheet(),
  );
}
