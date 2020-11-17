import 'package:uuid/uuid.dart';
import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class CheckoutCubit extends BaseCubit {
  CheckoutCubit(Repository repository) : super(repository);

  void loadPaymentDetails(String phoneNumber) {
    repository.requestSMSCode(phoneNumber);
  }

  Future<void> validatePhoneNumber(String phoneNumber, String smsCode) async {
    emit(BaseState(StateType.loading));
    final res = await repository.authenticateUser(phoneNumber, smsCode);
    if (res) {
      repository.saveUserSession();
      emit(BaseState(StateType.success));
    } else {
      emit(BaseState(StateType.error));
    }
  }

  void startCheckout(int totalPrice) {
    final userPhone = repository.getUserPhone();
    final orderIdentifier = Uuid().v1();
    final Map<String, Object> preferenceMap = {
      'items': [
        {
          'title': 'Test Order',
          'description': ' $userPhone $orderIdentifier',
          'order_payment_id': '',
          'currency_id': 'COP',
          'unit_price': totalPrice,
        }
      ],
      'payer': {'phone': '$userPhone'},
    };
  }
}
