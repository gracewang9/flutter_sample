import 'package:flutter/material.dart';
import 'package:flutter_sample/core/network/interceptors/auth_service.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();
    print("获取登录状态 ： ${authService.isLoggedIn}");
    if (!authService.isLoggedIn) {
      return RouteSettings(name: AppRoutes.login, arguments: {'from': route});
    }
    return null;
  }
}
