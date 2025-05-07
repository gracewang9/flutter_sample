class ResponseModel {
  final bool success; // 请求是否成功
  final dynamic data; // 响应数据
  final String? error; // 错误信息
  final int? statusCode; // 状态码

  ResponseModel({
    required this.success,
    this.data,
    this.error,
    this.statusCode,
  });
}
