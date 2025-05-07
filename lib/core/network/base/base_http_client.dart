import 'package:flutter_sample/core/network/base/response_model.dart';

abstract class BaseHttpClient {
  Future<ResponseModel> get(String url, {Map<String, dynamic>? params});

  Future<ResponseModel> post(String url, {dynamic data});

  Future<ResponseModel> upload(String url, String filePath);

  Future<ResponseModel> delete(String url, {dynamic data});
}
