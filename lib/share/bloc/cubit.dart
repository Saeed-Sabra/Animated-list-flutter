// ignore_for_file: camel_case_types

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_22/share/bloc/states.dart';

class loginCubit extends Cubit<LoginState> {
  loginCubit() : super(LoginInitial());
  static loginCubit get(context) => BlocProvider.of(context);

  bool isHidden = true;

  void changePassView() {
    isHidden = !isHidden;
    emit(LoginChangePasswordVisibilityState());
  }
}
