import 'package:bloc/bloc.dart';
import 'package:educational_center/data/models/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../core/pref.dart';
import '../../data/api_service/api_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);
  ApiService service = ApiService();

  StudentModel? studentModel;

  Future<void> getStudentProfile() async {
    try {
      emit(StudentProfileLoadingState());
      final response = await service.getStudentProfileData();
      emit(StudentProfileSuccessState());
      studentModel = response;
    } catch (error) {
      emit(StudentProfileErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }

  Future<void> updateStudentProfile({Map<String,dynamic>? data })async{
    try {
      print(data);
      emit(UpdateStudentLoadingState());
      final res = await service.updateStudentProfile(
        data: data!,
      );
      if (res != null && res['status'] != false) {
        emit(UpdateStudentSuccessState());
        Fluttertoast.showToast(
          msg: "Data Updated",
          backgroundColor: Colors.green,
        );
      } else if (res != null && res['error']) {
        emit(UpdateStudentErrorState());
        throw res.toString();
      }
    } catch (error) {
      emit(UpdateStudentErrorState());
      print(error.toString());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
    }
  }
  Future<void> logout()async{
    try{
      final response = await service.logout();
      await SharedPreferencesHelper.removeAccessToken();
      Fluttertoast.showToast(
        msg: response.toString(),
        backgroundColor: Colors.red,
      );
    }catch(error){
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
    }
  }
}
