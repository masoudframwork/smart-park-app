import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';
import '../../domain/payment_model.dart';
import '../../domain/payment_state.dart';

class PaymentMethodsController extends StateNotifier<PaymentMethodsState> {
  PaymentMethodsController()
      : super(
          PaymentMethodsState(
            methods: [
              PaymentMethodModel(
                id: 'visa_0000',
                type: PaymentMethodType.card,
                line1: 'البطاقة المنتهية بـ 0000',
                assetImage: AppImages.visaImage,
              ),
              PaymentMethodModel(
                id: 'apple_pay',
                type: PaymentMethodType.card,
                line1: 'البطاقة المنتهية بـ 0000',
                assetImage: AppImages.pay,
              ),
              PaymentMethodModel(
                id: 'wallet_balance',
                type: PaymentMethodType.wallet,
                line1: 'الرصيد 2,785 د.ا',
                assetImage: AppImages.account,
                assetColor: AppColor.primaryColor,
                logoContentMaxWidth: 24,
                logoContentMaxHeight: 27,
              ),
              PaymentMethodModel(
                id: 'add_new',
                type: PaymentMethodType.addNewCard,
                line1: 'بطاقة جديدة',
              ),
            ],
            selectedId: 'visa_0000',
          ),
        );

  void select(String id) {
    state = state.copyWith(selectedId: id);
  }

  PaymentMethodModel? get selectedMethod {
    return state.methods
        .where((m) => m.id == state.selectedId)
        .cast<PaymentMethodModel?>()
        .firstOrNull;
  }
}

// الـ Provider نفسه
final paymentMethodsProvider =
    StateNotifierProvider<PaymentMethodsController, PaymentMethodsState>((ref) {
  return PaymentMethodsController();
});
