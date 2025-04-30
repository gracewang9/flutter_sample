import 'package:dio/dio.dart';
import 'package:flutter_sample/core/network/dio_client.dart';
import 'package:get/get.dart';

import '../models/home_entity.dart';

class HomeRepository extends GetxService {
  final DioClient _dioClient = Get.find();
//Future<List<HomeEntity>>
  void getArticleList(int page) async {
    try {
      final response = await _dioClient.dio.get(
        "article/list/$page/json?cid=549",
      );
      print(response.data.toString());
       HomeEntity article = HomeEntity.fromJson(response.data);

      print(article.data!.datas!.toString());

      // return (response.data as List)
      //     .map((json) => HomeEntity.fromJson(json))
      //     .toList();
    } on DioException {
      rethrow;
    }
  }
}
