import 'package:flutter_sample/core/network/base_provider.dart';
import 'package:get/get.dart';
///Dio 封装
class ApiService extends BaseProvider {
  ///https://wanandroid.com/article/list/0/json?cid=549
  Future<Response> getArticleList(int page) => get("article/list/$page/json?cid=549");

}
