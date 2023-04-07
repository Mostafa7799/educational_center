import 'package:dio/dio.dart';
import 'package:educational_center/core/api_const.dart';
import 'package:educational_center/data/dio_helper/dio_helper.dart';

import '../models/student_model.dart';

class ApiService {
  Future signup({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: ApiConstant.registerEndPoint,
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(response.data);
      } else if (response.data['status'] == 'false') {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  Future login({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: ApiConstant.loginEndPoint,
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return Map<String, dynamic>.from(response.data);
      } else {
        print((response.data['error']).toString());
        throw (response.data['error']).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }
  /// logout
  Future<String> logout() async {
    try {
      final response = await DioHelper.getRequest(
        path: ApiConstant.logoutEndPoint,
      );
      print((response.data).toString());
      if (response.statusCode == 200) {
        return response.data;
      } else if (response.data== 'false') {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
    return '';
  }

  /// Get Student data
  Future<StudentModel> getStudentProfileData() async {
    try {
      final response = await DioHelper.getRequest(
        path: 'http://10.0.2.2:8000/api/user/profile',
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return StudentModel.fromJson(response.data);
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return StudentModel();
  }

/// Update student profile
  Future updateStudentProfile({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: ApiConstant.updateEndPoint,
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }
}
