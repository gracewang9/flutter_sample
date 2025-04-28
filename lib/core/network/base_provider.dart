import 'package:flutter_sample/common/api.dart';
import 'package:flutter_sample/data/models/home_entity.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Api.baseUrl;

    ///请求拦截
    httpClient.addRequestModifier<void>((request) {
      request.headers['apikey'] = '';
      return request;
    });

    ///响应拦截
    httpClient.addResponseModifier<void>((request, response) {
      return response;
    });

    ///身份认证
    httpClient.addAuthenticator<void>((request) async {
      final response = await get('http://');
      final token = response.body['token'];
      request.headers['Authenticator'] = '$token';
      return request;
    });
  }

  Future<Response<HomeEntity>> getCases(String path) => get(path);
}
