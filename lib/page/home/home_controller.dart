import 'package:flutter_sample/data/models/home_entity.dart';
import 'package:flutter_sample/core/network/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<HomeEntity> {
  ApiService provider = Get.find<ApiService>();

  void getArticleList() async {
    ///显示加载中
    change(null, status: RxStatus.loading());

    ///执行网络请求
    Response response = await provider.getArticleList(0);

    ///请求出错时
    if (response.hasError) {
      change(null, status: RxStatus.error('Error'));
    } else {
      ///请求成功时，显示数据
      HomeEntity article = HomeEntity.fromJson(response.body);
      change(article, status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    super.onInit();
    print("home controller onInit");
    Get.put(getArticleList());
  }
}
