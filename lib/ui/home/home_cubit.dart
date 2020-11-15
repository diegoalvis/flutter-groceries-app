import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/data/models/Address.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class HomeCubit extends BaseCubit {
  HomeCubit(Repository repository) : super(repository);

  Address getCurrentAddress() {
    final address = repository.getSavedAddress();
    return address;
  }
}
