import 'package:educational_center/data/api_service/api_service.dart';
import 'package:educational_center/data/models/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/pref.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);
  ApiService service = ApiService();

  /// Handel sign up
  Future<void> signUp(Map<String, dynamic> data) async {
    print(data);
    try {
      emit(SignUpLoadingState());
      final res = await service.signup(
        data: data,
      );
      if (res != null && res['status'] != false) {
        emit(SignUpSuccessState());
        Fluttertoast.showToast(
          msg: "Account created successfully",
          backgroundColor: Colors.green,
        );
        await SharedPreferencesHelper.saveAccessToken(res['token']);
      } else if (res != null && res['status'] != false) {
        emit(SignUpErrorState());
        throw res.toString();
      }
    } catch (error) {
      emit(SignUpErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
    }
  }

  /// handel Login
  Future<void> login(Map<String, dynamic> data) async {
    try {
      print(data);
      emit(LoginLoadingState());
      final res = await service.login(
        data: data,
      );
      if (res != null && res['status'] != false) {
        emit(LoginSuccessState());
        Fluttertoast.showToast(
          msg: "Welcome",
          backgroundColor: Colors.green,
        );
      } else if (res != null && res['error']) {
        emit(LoginErrorState());
        throw res.toString();
      }
    } catch (error) {
      emit(LoginErrorState());
      print(error.toString());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
    }
  }
}
