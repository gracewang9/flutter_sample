import 'package:get/get.dart';

class NavigationLogic extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    update();
  }
}
