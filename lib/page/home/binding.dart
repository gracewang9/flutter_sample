import 'package:get/get.dart';

import '../../core/network/interceptors/auth_service.dart';
import 'logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService(), permanent: true); // 全局单例
    Get.lazyPut(() => HomeLogic());
  }
}
