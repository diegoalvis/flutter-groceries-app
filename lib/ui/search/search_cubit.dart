import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class SearchCubit extends BaseCubit {
  SearchCubit(Repository repository) : super(repository);

  Future getCategoryList() async {
    emit(BaseState(StateType.loading));
    try {
      final res = await repository.getCategories();
      emit(BaseState(StateType.success, data: res));
    } catch (e) {
      emit(BaseState(StateType.error));
    }
  }
}
