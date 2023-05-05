import 'package:bloc/bloc.dart';
import 'package:educational_center/data/models/homework_model.dart';
import 'package:educational_center/data/models/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../core/pref.dart';
import '../../data/api_service/api_service.dart';

part 'home_controller_state.dart';

class HomeControllerCubit extends Cubit<HomeControllerState> {
  HomeControllerCubit() : super(HomeControllerInitial());

  static HomeControllerCubit get(BuildContext context) => BlocProvider.of(context);
  ApiService service = ApiService();
  String? selectedCourse;
  String? userName;

  Future<void> getUserName()async{
    userName = await SharedPreferencesHelper.getAccessName();
  }

  Future<String> teacherAddMessage({Map<String, dynamic>? data}) async {
    try {
      print(data);
      final res = await service.teacherAddMessage(
        data: data!,
      );
      if (res is String) {
        Fluttertoast.showToast(
          msg: res.toString(),
          backgroundColor: Colors.green,
        );
      } else if (res != null && res['error']) {
        Fluttertoast.showToast(
          msg: res['error'][0],
          backgroundColor: Colors.red,
        );
        throw res.toString();
      }
    } catch (error) {
      print(error.toString());
    }
    return '';
  }

  Future<String> teacherAddHomework({Map<String, dynamic>? data}) async {
    try {
      print(data);
      final res = await service.teacherAddHomework(
        data: data!,
      );
      if (res is String) {
        Fluttertoast.showToast(
          msg: res.toString(),
          backgroundColor: Colors.green,
        );
      } else if (res != null && res['error']) {
        Fluttertoast.showToast(
          msg: res['error'][0],
          backgroundColor: Colors.red,
        );
        throw res.toString();
      }
    } catch (error) {
      print(error.toString());
    }
    return '';
  }

  List<ActiveHomework> homeworkList = [];
  List<MessagesModel> messageList =[];
  Future<void> getMessagesList()async{
    try {
      emit(MessageListLoadingState());
      final response = await service.getMessageListData();
      messageList = response;
      emit(MessageListSuccessState());
    } catch (error) {
      emit(MessageListErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }

  Future<void> getHomeworkList({required String id})async{
    try {
      emit(HomeworkListLoadingState());
      final response = await service.getHomeworkListData(id: id);
      homeworkList = response;
      emit(HomeworkListSuccessState());
    } catch (error) {
      emit(HomeworkListErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }

  Future<void> studentAnswerHomework({
    Map<String, dynamic>? data,
  }) async {
    try {
      print(data);
      final res = await service.studentAnswerHomework(
        data: data!,
      );
      if (res != null && res['success'] != null) {
        Fluttertoast.showToast(
          msg: "Your homework saved",
          backgroundColor: Colors.green,
        );
      } else if (res != null && res['error']) {
        Fluttertoast.showToast(
          msg: res['error'][0],
          backgroundColor: Colors.red,
        );
        throw res.toString();
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
