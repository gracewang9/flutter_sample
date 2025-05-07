import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_navigation/get_navigation.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }
    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final authService = Get.find<AuthService>();
    // if (authService.isLoggedIn) {
    //   options.headers['Authorization'] = 'Bearer ${authService.token}';
    // }
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _ApiException.fromDioError(err);
    Get.snackbar('请求失败', exception.message);
    super.onError(err, handler);
  }
}

class _ApiException implements Exception {
  final String message;
  final int? statusCode;

  _ApiException({required this.message, this.statusCode});

  factory _ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return _ApiException(message: '连接超时');
      case DioExceptionType.badResponse:
        return _handleResponse(error);
      default:
        return _ApiException(message: '网络异常，请检查连接');
    }
  }

  //
  static _ApiException _handleResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    switch (statusCode) {
      case 401:
        return _ApiException(message: '身份认证失败', statusCode: statusCode);
      case 404:
        return _ApiException(message: '资源不存在', statusCode: statusCode);
      default:
        return _ApiException(message: '服务器异常 ($statusCode)');
    }
  }
}
