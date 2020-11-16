import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class VendorProductsCubit extends BaseCubit {

  VendorProductsCubit(Repository repository) : super(repository);

  Future getProducts(int vendorId) async {
    emit(BaseState(StateType.loading));
    try {
      final res = await repository.getProducts(vendorId);
      emit(BaseState(StateType.success, data: res));
    } catch (e) {
      emit(BaseState(StateType.error));
    }
  }
}
