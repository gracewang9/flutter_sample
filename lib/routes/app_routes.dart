import 'package:flutter_sample/main.dart';
import 'package:flutter_sample/page/details/details_binding.dart';
import 'package:flutter_sample/page/details/details_view.dart';
import 'package:flutter_sample/page/login/login_page.dart';
import 'package:flutter_sample/routes/auth_middleware.dart';
import 'package:flutter_sample/page/settings/settings_binding.dart';
import 'package:get/get.dart';

import '../page/settings/settings_view.dart';

abstract class AppRoutes {
  static const home = '/home';
  static const login = '/login';
  static const setting = '/settings';
  static const detail = '/details';
  static final pages = {
    GetPage(
      name: home,
      page: () => MyHomePage(title: "home"),
      middlewares: [AuthMiddleware()], //判断是否登录
    ),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: detail, page: () => DetailsPage(), binding: DetailsBinding()),
    GetPage(
      name: setting,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
  };
}
