import 'package:flutter/material.dart';
import 'package:flutter_sample/common/app_languages.dart';
import 'package:flutter_sample/page/home/binding.dart';
import 'package:flutter_sample/page/home/view.dart';
import 'package:flutter_sample/page/navigation/view.dart';
import 'package:flutter_sample/page/theme/theme_view.dart';
import 'package:flutter_sample/routes/app_routes.dart';
import 'package:get/get.dart';

void main() async {
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      initialBinding: HomeBinding(),
      getPages: AppRoutes.pages.toList(),
      translations: AppLanguages(),
      locale: Locale('zh', 'CN'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData.light().copyWith(primaryColor: Colors.white),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.black),
      themeMode: ThemeMode.system,
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ///使用get.put实例化你的类
    return Scaffold(
      ///Text套上Obx(()=>Text("${controller.count}"))表示当controller.count的值变化时会更新页面
      appBar: AppBar(
        title: Text("Flutter Demo"),
        actions: [
          TextButton(
            onPressed: () {
              Get.defaultDialog(
                cancelTextColor: Theme.of(context).primaryColor,
                confirmTextColor: Theme.of(context).primaryColor,
                title: '选择主题',
                content: Container(
                  color: Theme.of(context).primaryColor,
                  child: ThemePage(),
                ),
              );
            },
            child: Text('theme'.tr),
          ),
        ],
        leading: TextButton(
          child: Text("login".tr),
          onPressed: () {
            Get.toNamed(AppRoutes.login);
          },
        ),
        flexibleSpace: IconButton(icon: Icon(Icons.add), onPressed: () {}),
      ),
      body: NavigationPage(),
    );
  }
}
