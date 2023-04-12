import 'package:educational_center/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../data/api_service/api_service.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());
  static CourseCubit get(BuildContext context) => BlocProvider.of(context);
  ApiService service = ApiService();

  List<CourseModel> coursesList = [];

  Future<void> getCoursesList()async{
    try {
      emit(CoursesListLoadingState());
      final response = await service.getCoursesListData();
      emit(CoursesListSuccessState());
      coursesList = response;
    } catch (error) {
      emit(CoursesListErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }

  Future<void> enrollCourse({required int id})async{
    try {
      final response = await service.enrollCourse(id: id);
      if(response['status'] != false){
        Fluttertoast.showToast(
          msg: response['success'].toString(),
          backgroundColor: Colors.green,
        );
      }else{
        Fluttertoast.showToast(
          msg: 'this course is Enrolled',
          backgroundColor: Colors.red,
        );
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }

  Future<void> disEnrollCourse({required int id})async{
    try {
      final response = await service.disEnrollCourse(id: id);
        Fluttertoast.showToast(
          msg: response['success'].toString(),
          backgroundColor: Colors.green,
        );

    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }
}
