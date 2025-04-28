import 'package:flutter/material.dart';
import 'package:flutter_sample/core/network/auth_service.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService.isLoggedIn == true
        ? RouteSettings(name: "/login")
        : null;
  }
}
