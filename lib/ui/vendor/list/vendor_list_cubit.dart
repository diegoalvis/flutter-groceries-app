import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class VendorListCubit extends BaseCubit {

  VendorListCubit(Repository repository) : super(repository);

  Future<void> getVendorList() async {
    emit(BaseState(StateType.loading));
    try {
      final res = await repository.getVendors();
      emit(BaseState(StateType.success, data: res));
    } catch (e) {
      emit(BaseState(StateType.error));
    }
  }
}
