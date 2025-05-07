import 'package:dio/dio.dart';
import 'package:flutter_sample/core/network/dio/dio_adapter.dart';
import 'package:flutter_sample/core/network/http/http_adapter.dart';
import 'package:http/http.dart' as http;

import 'base_http_client.dart';
import 'network_config.dart';

class HttpClientFactory {
  static BaseHttpClient createHttpClient() {
    switch (NetworkConfig.currentFramework) {
      case NetworkFramework.dio:
        var options = BaseOptions(
          baseUrl: NetworkConfig.baseUrl,
          headers: NetworkConfig.headers,
          connectTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
        );
        var dio = Dio(options);
        dio.interceptors.addAll(NetworkConfig.listInterceptor);
        return DioAdapter(dio: dio);
      case NetworkFramework.http:
        return HttpAdapter(client: http.Client());
    }
  }
}
