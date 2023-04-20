import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../data/api_service/api_service.dart';
import '../../data/models/subject_model.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit() : super(SubjectInitial());

  static SubjectCubit get(BuildContext context) => BlocProvider.of(context);
  ApiService service = ApiService();

  List<SubjectModel>? subjectList;

  Future<void> getSubjectList({required String endPoint})async{
    try {
      emit(SubjectListLoadingState());
      final response = await service.getSubjectListData(endPoint: endPoint);
      subjectList = response;
      print(subjectList);
      emit(SubjectListSuccessState());
    } catch (error) {
      emit(SubjectListErrorState());
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      throw error.toString();
    }
  }
}
