
import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class AccountCubit extends BaseCubit {
  AccountCubit(Repository repository) : super(repository);

  Future logout() async {
    emit(BaseState(StateType.loading));
    await repository.logout();
    emit(BaseState(StateType.navigate));
  }
}
