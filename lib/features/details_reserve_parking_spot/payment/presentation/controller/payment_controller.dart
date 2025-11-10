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
                line1: 'البطاقة المنتهية بـ 0000',
                assetImage: AppImages.visaImage,
              ),
              PaymentMethodModel(
                id: 'stc_pay',
                line1: 'البطاقة المنتهية بـ 0000',
                assetImage: AppImages.pay,
              ),
              PaymentMethodModel(
                id: 'wallet_balance',
                line1: 'الرصيد 2,785 د.ا',
                assetImage: AppImages.account,
                assetColor: AppColor.primaryColor,
                logoMaxW: 32,
                logoMaxH: 35,
              ),
              PaymentMethodModel(
                id: 'add_new',
                line1: 'بطاقة جديدة',
                assetImage: AppImages.add,
                assetColor: AppColor.primaryColor,
                logoMaxW: 32,
                logoMaxH: 35,

              ),
            ],
            selectedId: 'visa_0000',
          ),
        );

  void select(String id) {
    state = state.copyWith(selectedId: id);
  }

  PaymentMethodModel? get selectedMethod {
    return state.methods.firstWhere(
      (m) => m.id == state.selectedId,
      orElse: () => state.methods.first,
    );
  }
}

final paymentMethodsProvider =
    StateNotifierProvider<PaymentMethodsController, PaymentMethodsState>(
  (ref) => PaymentMethodsController(),
);
