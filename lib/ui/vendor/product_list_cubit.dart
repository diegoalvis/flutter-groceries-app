import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class ProductListCubit extends BaseCubit {

  ProductListCubit(Repository repository) : super(repository);

  Future<void> getProductList() async {
    try {
      emit(BaseState(StateType.loading));
      await Future.delayed(Duration(seconds: 2));
      final res = await repository.getProducts("vendorId");
      emit(BaseState(StateType.success, data: res));
    } catch (e) {
      emit(BaseState(StateType.error));
    }
  }
}
