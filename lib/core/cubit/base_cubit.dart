
import 'package:bloc/bloc.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

import 'base_state.dart';

abstract class BaseCubit extends Cubit<BaseState> {
  final Repository repository;

  BaseCubit(this.repository) : super(BaseState(StateType.initial));
}