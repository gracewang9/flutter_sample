import 'package:dio/dio.dart';
import 'package:flutter_sample/core/network/auth_service.dart';
import 'package:get/get.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authService = Get.find<AuthService>();
    if (authService.isLoggedIn) {
      options.headers['Authorization'] = 'Bearer ${authService.token}';
    }
    super.onRequest(options, handler);
  }
}

//class AuthInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     final authService = Get.find<AuthService>();
//     if (authService.isLoggedIn) {
//       options.headers['Authorization'] = 'Bearer ${authService.token}';
//     }
//     super.onRequest(options, handler);
//   }
// }
