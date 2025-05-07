import 'package:dio/dio.dart';
import 'package:flutter_sample/common/api.dart';
import 'package:flutter_sample/core/network/interceptors/error_interceptor.dart';

enum NetworkFramework { dio, http }

class NetworkConfig {
  static NetworkFramework currentFramework = NetworkFramework.dio;
  static String baseUrl = Api.baseUrl;
  static Map<String, String> headers = {'Content-Type': 'application/json'};
  static List<Interceptor> listInterceptor = [CustomInterceptor(),LogInterceptor()];
}
