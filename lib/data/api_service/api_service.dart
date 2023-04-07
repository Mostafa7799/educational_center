import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:educational_center/core/api_const.dart';
import 'package:educational_center/data/dio_helper/dio_helper.dart';


class ApiService {
  Future signup({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'http://10.0.2.2:8000/api/user/register',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(response.data);
      } else if (response.data['status'] == 'false') {
        print((response.data).toString());
        throw (response.data).toString();
      }
    }on DioError catch (error) {
      print(error.toString());
    }
  }

  Future login({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'http://10.0.2.2:8000/api/user/login',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return Map<String, dynamic>.from(response.data);
      } else{
        print((response.data['error']).toString());
        throw (response.data['error']).toString();
      }
    }on DioError catch (error) {
      print(error.toString());
    }
  }
}
