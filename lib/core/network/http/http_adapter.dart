import 'dart:convert';

import 'package:flutter_sample/core/network/base/base_http_client.dart';
import 'package:flutter_sample/core/network/base/response_model.dart';
import 'package:http/http.dart' as http;

class HttpAdapter implements BaseHttpClient {
  final http.Client _client;

  HttpAdapter({required http.Client client}) : _client = client;

  @override
  Future<ResponseModel> delete(String url, {data}) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: data);
      final response = await _client.delete(uri);
      if (response.statusCode == 200) {
        return ResponseModel(success: true, data: json.decode(response.body));
      } else {
        return ResponseModel(
          success: false,
          error: 'HTTP 请求失败: ${response.statusCode}',
          data: json.decode(response.body),
        );
      }
    } catch (e) {
      return ResponseModel(success: false, error: e.toString());
    }
  }

  @override
  Future<ResponseModel> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: params);
      final response = await _client.get(uri);
      if (response.statusCode == 200) {
        return ResponseModel(success: true, data: json.decode(response.body));
      } else {
        return ResponseModel(success: false, data: json.decode(response.body));
      }
    } catch (e) {
      return ResponseModel(success: false, error: e.toString());
    }
  }

  @override
  Future<ResponseModel> post(String url, {data}) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: data);
      final response = await _client.post(uri);
      if (response.statusCode == 200) {
        return ResponseModel(success: true, data: json.decode(response.body));
      } else {
        return ResponseModel(success: false, data: json.decode(response.body));
      }
    } catch (e) {
      return ResponseModel(success: false, error: e.toString());
    }
  }

  @override
  Future<ResponseModel> upload(String url, String filePath) async {
    // try {
    //   final uri = Uri.parse(url).replace(queryParameters: filePath);
    //   final response = await _client(uri);
    //   if (response.statusCode == 200) {
    //     return ResponseModel(success: true, data: json.decode(response.body));
    //   } else {
    //     return ResponseModel(success: false, data: json.decode(response.body));
    //   }
    // } catch (e) {
    return ResponseModel(success: false, error: "还没完成");
    // }
  }
}
