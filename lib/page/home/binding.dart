import 'package:get/get.dart';
import 'package:flutter_sample/core/network/api_service.dart';

import 'logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.lazyPut(() => HomeLogic());
  }
}
