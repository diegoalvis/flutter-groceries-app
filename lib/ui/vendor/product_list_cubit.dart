import 'package:bloc/bloc.dart';
import 'package:winkels_customer/data/repository/vendor_repository.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final VendorRepository _repository;

  ProductListCubit(this._repository) : super(ProductListState(StateType.initial));

  Future<void> getProductList() async {
    try {
      emit(ProductListState(StateType.loading));
      await Future.delayed(Duration(seconds: 2));
      final res = await _repository.getProducts("vendorId");
      emit(ProductListState(StateType.success, data: res));
    } catch (e) {
      emit(ProductListState(StateType.error));
    }
  }
}


class ProductListState {
  final StateType type;
  dynamic data;

  ProductListState(this.type, {this.data});
}


// TODO sacar a una clase aparte
enum StateType { initial, loading, success, error }
