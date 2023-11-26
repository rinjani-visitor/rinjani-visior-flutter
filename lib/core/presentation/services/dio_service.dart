import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

final dioServiceProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 8),
      connectTimeout: const Duration(seconds: 8),
      sendTimeout: const Duration(seconds: 8)));
  dio.interceptors.add(InterceptorsWrapper(
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
          "ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      return handler.next(e);
    },
  ));
  return dio;
});
