import 'package:educational_center/data/api_service/api_service.dart';
import 'package:educational_center/data/dio_helper/dio_helper.dart';
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
      if (res['token'] != null && res['status'] != false) {
        emit(SignUpSuccessState());
        Fluttertoast.showToast(
          msg: "Account created successfully",
          backgroundColor: Colors.green,
        );
        await SharedPreferencesHelper.saveAccessToken(res['token']);
        DioHelper.init(token: res['token']);
        await SharedPreferencesHelper.saveAccessName(res['username']);
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
      if (res['token'] != null) {
        emit(LoginSuccessState());
        Fluttertoast.showToast(
          msg: "Welcome",
          backgroundColor: Colors.green,
        );
        await SharedPreferencesHelper.saveAccessToken(res['token']);
        DioHelper.init(token: res['token']);
        await SharedPreferencesHelper.saveAccessName(res['username']);
        await SharedPreferencesHelper.saveTeacher(false);
      } else if (res != null && res['error']) {
        emit(LoginErrorState());
        throw res.toString();
      }
    } catch (error) {
      emit(LoginErrorState());
      print(error.toString());
      Fluttertoast.showToast(
        msg: 'Please enter a valid data',
        backgroundColor: Colors.red,
      );
    }
  }

  /// handel Teacher Login
  Future<void> loginTeacher(Map<String, dynamic> data) async {
    try {
      print(data);
      emit(LoginTeacherLoadingState());
      final res = await service.loginTeacher(
        data: data,
      );
      if (res['token'] != null) {
        emit(LoginTeacherSuccessState());
        Fluttertoast.showToast(
          msg: "Welcome ${res['username']}",
          backgroundColor: Colors.green,
        );
        await SharedPreferencesHelper.saveAccessToken(res['token']);
        await SharedPreferencesHelper.saveTeacher(true);
        await SharedPreferencesHelper.saveAccessName(res['username']);
        DioHelper.init(token: res['token']);
      } else if (res != null && res['error']) {
        emit(LoginTeacherErrorState());
        throw res.toString();
      }
    } catch (error) {
      emit(LoginErrorState());
      print(error.toString());
      Fluttertoast.showToast(
        msg: 'Please enter a valid data',
        backgroundColor: Colors.red,
      );
    }
  }

  String? password;
  /// handel Teacher Login
  Future<void> resetPassword(Map<String, dynamic> data) async {
    try {
      print(data);
      emit(ResetLoadingState());
      final res = await service.resetPassword(
        data: data,
      );
      if (res != null) {
        password = res['new_password'];
        emit(ResetSuccessState());
        Fluttertoast.showToast(
          msg: res['new_password'],
          timeInSecForIosWeb: 20000,
          backgroundColor: Colors.green,
        );
      } else if (res != null && res['error']) {
        emit(ResetErrorState());
        throw res.toString();
      }
    } catch (error) {
      emit(LoginErrorState());
      print(error.toString());
      Fluttertoast.showToast(
        msg: 'Please enter a valid data',
        backgroundColor: Colors.red,
      );
    }
  }
}
