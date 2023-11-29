import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

import 'package:rinjani_visitor/core/exception/exception.dart';

final _baseOptions = BaseOptions(
  receiveTimeout: const Duration(seconds: 8),
  connectTimeout: const Duration(seconds: 8),
  sendTimeout: const Duration(seconds: 8),
);

final _logInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {
    developer.log(
        "REQUEST[${options.method}] => PATH: ${options.path}, ${options.data}");
    developer.log("Authorization: ${options.headers["Authorization"]}");
    return handler.next(options);
  },
  onResponse: (response, handler) {
    developer.log(
        "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}");
    developer.log("BODY[${response.data.toString()}]");
    return handler.next(response);
  },
  onError: (e, handler) {
    developer.log(
        "ERROR[${e.response?.statusCode}]");
    developer.log("BODY = ${e.response?.data.toString()}");

    return handler.next(ExtException.fromDioException(e));
  },
);

final dioServiceProvider = Provider((ref) {
  final dio = Dio(_baseOptions);
  dio.interceptors.add(_logInterceptor);
  return dio;
});
