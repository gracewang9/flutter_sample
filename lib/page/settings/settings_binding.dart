import 'package:flutter_sample/page/settings/settings_logic.dart';
import 'package:get/get.dart';


class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsLogic());
  }
}
