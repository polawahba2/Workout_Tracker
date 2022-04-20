import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'States.dart';

class AppCubit extends Cubit<States> {
  AppCubit() : super(InitialState());
  static AppCubit getCubit(context) => BlocProvider.of(context);
}
