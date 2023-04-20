import 'package:educational_center/data/models/questions_model.dart';
import 'package:educational_center/data/models/quiz_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../data/api_service/api_service.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  static QuizCubit get(BuildContext context) => BlocProvider.of(context);
  ApiService service = ApiService();

  List<QuizModel>? quizList;
  List<QuestionsModel> questionList =[];
  String? selectedCourse;
  Future<void> getQuizList({required String endPoint}) async {
    try {
      emit(QuizListLoadingState());
      final response = await service.getQuizListData(endPoint: endPoint);
      quizList = response;
      emit(QuizListSuccessState());
      print(quizList);
    } catch (error) {
      emit(QuizListErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }

  Future<void> getQuestionsList({required String endPoint}) async {
    try {
      emit(QuestionListLoadingState());
      final response = await service.getQuestionsListData(endPoint: endPoint);
      questionList = response;
      emit(QuestionListSuccessState());
      print(quizList);
    } catch (error) {
      emit(QuestionListErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }

  Future<void> teacherAddQuiz({Map<String, dynamic>? data}) async {
    try {
      print(data);
      final res = await service.teacherAddQuiz(
        data: data!,
      );
      if (res is int) {
        Fluttertoast.showToast(
          msg: "Quiz Added",
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

  Future<void> teacherAddAnswerToQuiz({
    Map<String, dynamic>? data,
  }) async {
    try {
      print(data);
      final res = await service.teacherAddAnswerToQuiz(
        data: data!,
      );
      if (res != null && res['success'] != null) {
        Fluttertoast.showToast(
          msg: "Question Added",
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

  Future<void> studentAnswerQuiz({
    Map<String, dynamic>? data,
  }) async {
    try {
      print(data);
      final res = await service.studentAnswerQuiz(
        data: data!,
      );
      if (res != null && res['success'] != null) {
        Fluttertoast.showToast(
          msg: "Your answer saved",
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
