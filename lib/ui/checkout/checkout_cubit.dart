import 'package:mercado_pago_integration/core/failures.dart';
import 'package:mercado_pago_integration/mercado_pago_integration.dart';
import 'package:mercado_pago_integration/models/payment.dart';
import 'package:uuid/uuid.dart';
import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/core/stripe/stripe_helper.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class CheckoutCubit extends BaseCubit {
  CheckoutCubit(Repository repository) : super(repository);

  Future<void> startCheckout(int totalPrice) async {
    emit(BaseState(StateType.loading));
    try {
      final userPhone = repository.getUserPhone();
      final Map<String, Object> preferenceMap = {
        'items': [
          {
            'title': 'Test Order',
            'description': 'Description',
            'quantity': 1,
            'order_id': '',
            'currency_id': 'COP',
            'unit_price': totalPrice,
          }
        ],
        "payer": {
          "email": "test@winkels.com",
          "phone": {"number": userPhone},
        }
      };

      final checkoutReq = await MercadoPagoIntegration.startCheckout(
        publicKey: PaymentHelper.PUBLIC_KEY,
        preference: preferenceMap,
        accessToken: PaymentHelper.ACCESS_TOKEN,
      );

      checkoutReq.fold(
        (Failure failure) {
          emit(BaseState(StateType.error, data: '${failure.message}'));
        },
        (Payment payment) {
          emit(BaseState(StateType.success, data: payment));
        },
      );
    } catch (e) {
      emit(BaseState(StateType.error));
    }
  }
}
