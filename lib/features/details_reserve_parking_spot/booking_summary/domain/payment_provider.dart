import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../payment/domain/payment_model.dart';

final selectedPaymentMethodProvider = StateNotifierProvider<PaymentMethodController, PaymentMethodModel?>(
      (ref) => PaymentMethodController(),
);

class PaymentMethodController extends StateNotifier<PaymentMethodModel?> {
  PaymentMethodController() : super(null);

  void select(PaymentMethodModel method) => state = method;
}
