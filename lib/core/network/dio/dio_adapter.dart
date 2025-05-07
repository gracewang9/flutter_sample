import 'package:dio/dio.dart';
import 'package:flutter_sample/core/network/base/base_http_client.dart';
import 'package:flutter_sample/core/network/base/response_model.dart';

class DioAdapter extends BaseHttpClient {
  final Dio _dio;

  DioAdapter({required Dio dio}) : _dio = dio;


  @override
  Future<ResponseModel> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(url, queryParameters: params);
      return ResponseModel(success: true, data: response.data);
    } on DioException catch (e) {
      return ResponseModel(
        success: false,
        error: e.message ?? "Dio 请求失败",
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<ResponseModel> post(String url, {data}) async {
    try {
      final response = await _dio.post(url, queryParameters: data);
      return ResponseModel(success: true, data: response.data);
    } on DioException catch (e) {
      return ResponseModel(
        success: false,
        error: e.message ?? "Dio 请求失败",
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<ResponseModel> delete(String url, {data}) async {
    try {
      final response = await _dio.delete(url, queryParameters: data);
      return ResponseModel(success: true, data: response.data);
    } on DioException catch (e) {
      return ResponseModel(
        success: false,
        error: e.message ?? "Dio 请求失败",
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<ResponseModel> upload(String url, String filePath) async {
    // try {
    //   final response = await _dio.up(url, queryParameters: params);
    //   return ResponseModel(success: true, data: response.data);
    // } on DioException catch (e) {
    return ResponseModel(success: false);
    // }
  }
}

//final formData = FormData.fromMap({
//   'name': 'dio',
//   'date': DateTime.now().toIso8601String(),
//   'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
//   'files': [
//     await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
//     await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
//   ]
// });
// final response = await dio.post('/info', data: formData);
