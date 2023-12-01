import 'package:dio/dio.dart';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

/// my custom logger interceptor. this should be placed before any interceptors
class LoggerInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log(
      "REQUEST[${options.method}] => PATH: ${options.path}",
      name: runtimeType.toString(),
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(
      "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}",
      name: runtimeType.toString(),
    );
    developer.log("BODY: ${response.data.toString()}",
        name: runtimeType.toString());
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log(
      "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}",
      error: err.response,
      name: runtimeType.toString(),
    );

    super.onError(err, handler);
  }
}
