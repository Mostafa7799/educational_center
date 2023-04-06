import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.13:8000/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        // 20 seconds
        receiveTimeout: const Duration(seconds: 20),
        // 20 seconds
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }
      ),
    );
  }

  static Future<Response> getRequest(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      path,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> postRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? data,
  }) async {
    return await dio.post(path, queryParameters: queryParameters, data: data);
  }

  static Future<Response> putRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? data,
  }) async {
    return await dio.put(path, queryParameters: queryParameters, data: data);
  }

  static Future<Response> patchRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? data,
  }) async {
    return await dio.patch(path, queryParameters: queryParameters, data: data);
  }

  static Future<Response> deleteRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.delete(path, queryParameters: queryParameters, data: {});
  }
}
