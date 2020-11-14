import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class PhoneCubit extends BaseCubit {
  PhoneCubit(Repository repository) : super(repository);

  void requestPhoneNumber(String phoneNumber) {
    repository.requestSMSCode(phoneNumber);
  }

  Future<void> validatePhoneNumber(String smsCode) async {
    final res = await repository.authenticateUser(smsCode);
    if(res) {
      emit(BaseState(StateType.success));
    } else {
      emit(BaseState(StateType.error));
    }
  }
}
