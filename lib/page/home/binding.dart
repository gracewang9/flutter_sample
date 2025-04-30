import 'package:get/get.dart';
import 'package:flutter_sample/core/network/api_service.dart';

import '../../data/repositories/home_repository.dart';
import 'logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    // Get.put(HomeRepository());
    Get.lazyPut(() => HomeLogic());
  }
}
