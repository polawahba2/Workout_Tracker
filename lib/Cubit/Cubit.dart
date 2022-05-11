import 'package:flutter_bloc/flutter_bloc.dart';

import 'States.dart';

class AppCubit extends Cubit<States> {
  AppCubit() : super(InitialState());
  bool exersiceIsStart = false;
  int numberOfSets = 0;
  List repsValues = [];
  List weightsValues = [];

  static AppCubit getCubit(context) => BlocProvider.of(context);

  void startExersice() {
    emit(ToggleTheExersiceState());
    exersiceIsStart = !exersiceIsStart;
  }

  void addNewExercise() {
    numberOfSets++;
    emit(AddNewExersiceState());
  }

  void removeExercise() {
    numberOfSets--;
    emit(RemoveExersiceState());
  }
}
