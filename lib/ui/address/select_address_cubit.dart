import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/models/Address.dart';
import 'package:winkels_customer/data/models/City.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class SelectAddressCubit extends BaseCubit {
  SelectAddressCubit(Repository repository) : super(repository);

  //TODo esto deberia traerlo desde el servidor
  List<City> mockACityList = ['Bogota', 'Medellin', 'Cali'].map((e) => City(e, e.substring(0, 3).toUpperCase(), 'COL')).toList();

  Future<void> saveAddress(String address, City city) async {
    emit(BaseState(StateType.loading));
    final userAddress = Address(address: address, cityName: city.name, cityCode: city.cityCode, countryCode: city.countryCode);
    final res = await repository.saveUserAddress(userAddress);
    if (res) {
      emit(BaseState(StateType.navigate));
    } else {
      emit(BaseState(StateType.error));
    }
  }

  String getSelectedCity() {
    return repository.getSavedAddress()?.cityName;
  }
}
