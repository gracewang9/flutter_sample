import 'package:flutter_sample/page/details/details_view.dart';
import 'package:flutter_sample/page/settings/settings_binding.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../page/login/view.dart';
import '../page/settings/settings_view.dart';
import 'auth_middleware.dart';

abstract class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const setting = '/settings';
  static const detail = '/details';
  static final pages = {
    GetPage(
      name: home,
      page: () => Home(),
      middlewares: [AuthMiddleware()], //判断是否登录
    ),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: detail, page: () => DetailsPage()),
    GetPage(
      name: setting,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
  };
}
