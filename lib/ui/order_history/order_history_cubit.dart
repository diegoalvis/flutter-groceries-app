import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class OrderHistoryCubit extends BaseCubit {

  OrderHistoryCubit(Repository repository) : super(repository);

  Future<void> getOrders() async {
    emit(BaseState(StateType.loading));
    try {
      final res = await repository.getMyOrders();
      emit(BaseState(StateType.success, data: res));
    } catch (e) {
      emit(BaseState(StateType.error));
    }
  }
}
