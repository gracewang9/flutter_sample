import 'package:dio/dio.dart';
import 'package:flutter_sample/common/api.dart';
import 'package:flutter_sample/core/network/interceptors/auth_interceptor.dart';
import 'package:flutter_sample/core/network/interceptors/error_interceptor.dart';
import 'package:get/get.dart';

class DioClient extends GetxService {
  late Dio _dio;

  Dio get dio => _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(
      BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      AuthInterceptor(),
      ErrorInterceptor(),
    ]);
  }
}
