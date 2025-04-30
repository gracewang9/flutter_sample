import 'package:flutter/material.dart';
import 'package:flutter_sample/page/home/view.dart';
import 'package:flutter_sample/page/navigation/logic.dart';
import 'package:get/get.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({super.key});

  final List tabs = ["新闻", "历史", "图片"];

  final NavigationLogic logic = Get.put(NavigationLogic());
  static const TextStyle _textStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static final List<Widget> _widgetOptions = <Widget>[
    HomeTabBarWidget(),
  Center(child:  Text('Index 1: Business', style: _textStyle)),
    Center(child: Text('Index 2: Me', style: _textStyle)),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationLogic>(
      builder:
          (logic) => Scaffold(
            appBar: null,
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "home".tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: "business".tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "me".tr,
                ),
              ],
              selectedItemColor: Colors.amber[800],
              currentIndex: logic.selectedIndex,
              onTap: logic.onItemTapped,
            ),
            body: _widgetOptions.elementAt(logic.selectedIndex),
          ),
    );
  }
}
