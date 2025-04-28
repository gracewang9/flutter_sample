import 'package:flutter_sample/core/network/api_service.dart';
import 'package:flutter_sample/page/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.lazyPut(()=>HomeController());
  }

}