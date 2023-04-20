import 'package:bloc/bloc.dart';
import 'package:educational_center/data/models/student_model.dart';
import 'package:educational_center/data/models/teacher_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../core/pref.dart';
import '../../data/api_service/api_service.dart';
import '../../data/models/user_attendance.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);
  ApiService service = ApiService();

  StudentModel? studentModel = StudentModel();
  List<UserAttendance> usersList = [];
  TeacherModel? teacherModel = TeacherModel();
  String? emailVerifiedAt;

  Future<void> getStudentProfile() async {
    try {
      emit(StudentProfileLoadingState());
      final response = await service.getStudentProfileData();
      studentModel = response;
      emailVerifiedAt = response.emailVerifiedAt;
      emit(StudentProfileSuccessState());
    } catch (error) {
      emit(StudentProfileErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }

  Future<void> getTeacherProfile() async {
    try {
      emit(TeacherProfileLoadingState());
      final response = await service.getTeacherProfileData();
      emit(TeacherProfileSuccessState());
      teacherModel = response;
    } catch (error) {
      emit(TeacherProfileErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }

  Future<void> updateTeacherProfile({Map<String,dynamic>? data })async{
    try {
      print(data);
      final res = await service.updateTeacherProfile(
        data: data!,
      );
      if (res != null && res['status'] != false) {
        Fluttertoast.showToast(
          msg: "Data Updated",
          backgroundColor: Colors.green,
        );
      } else if (res != null && res['error']) {
        throw res.toString();
      }
    } catch (error) {
      print(error.toString());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
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

  Future<void> studentSendFeedback({Map<String,dynamic>? data })async{
    try {
      print(data);
      final res = await service.studentSendFeedback(
        data: data!,
      );
      if (res != null) {
        emit(UpdateStudentSuccessState());
        Fluttertoast.showToast(
          msg: res.toString(),
          backgroundColor: Colors.green,
        );
      } else if (res != null && res['error']) {
        throw res.toString();
      }
    } catch (error) {
      print(error.toString());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> teacherSendAttendance({Map<String,dynamic>? data })async{
    try {
      print(data);
      final res = await service.teacherSendAttendance(
        data: data!,
      );
      if (res != null) {
        Fluttertoast.showToast(
          msg: res.toString(),
          backgroundColor: Colors.green,
        );
      } else if (res != null && res['error']) {
        throw res.toString();
      }
    } catch (error) {
      print(error.toString());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> logout({required String endPoint})async{
    try{
      final response = await service.logout(endPoint: endPoint);
      await SharedPreferencesHelper.removeAccessToken();
      await SharedPreferencesHelper.removeTeacher();
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

  List<TeacherModel> teacherList = [];

  Future<void> getTeacherList()async{
    try {
      emit(TeacherListLoadingState());
      final response = await service.getTeacherListData();
      emit(TeacherListSuccessState());
      teacherList = response;
    } catch (error) {
      emit(TeacherListErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }

  Future<void> getUsersList({required String id})async{
    try {
      emit(StudentListLoadingState());
      final response = await service.getUsersListData(id: id);
      emit(StudentListSuccessState());
      usersList = response;
    } catch (error) {
      emit(StudentListErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }
}
