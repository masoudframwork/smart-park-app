
import 'payment_model.dart';

class PaymentMethodsState {
  final List<PaymentMethodModel> methods;
  final String? selectedId;

  const PaymentMethodsState({
    required this.methods,
    required this.selectedId,
  });

  PaymentMethodsState copyWith({
    List<PaymentMethodModel>? methods,
    String? selectedId,
  }) {
    return PaymentMethodsState(
      methods: methods ?? this.methods,
      selectedId: selectedId ?? this.selectedId,
    );
  }
}
