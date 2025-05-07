import 'package:flutter_sample/core/network/base/base_http_client.dart';
import 'package:flutter_sample/core/network/base/http_client_factory.dart';
import 'package:get/get.dart';

import 'package:flutter_sample/data/models/home_entity.dart';


class HomeLogic extends GetxController with StateMixin<HomeEntity> {
  BaseHttpClient httpClient = HttpClientFactory.createHttpClient();

  void getArticleList(int page) async {
    ///显示加载中
    change(null, status: RxStatus.loading());
    ///执行网络
    var response = await httpClient.get('article/list/$page/json?cid=549');
    if (response.success) {
      var entity = HomeEntity.fromJson(response.data);
      change(entity, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error('Error'));
    }
  }

  @override
  void onInit() {
    super.onInit();
    print("home controller onInit");
    Get.put(getArticleList(0));
  }
}
