import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rinjani_visitor/core/presentation/interceptors/exception.dart';
import 'package:rinjani_visitor/core/presentation/interceptors/logger.dart';

final _baseOptions = BaseOptions(
  receiveTimeout: const Duration(seconds: 60),
  connectTimeout: const Duration(seconds: 60),
  sendTimeout: const Duration(seconds: 60),
);

final dioServiceProvider = Provider((ref) {
  final dio = Dio(_baseOptions);
  dio.interceptors.add(LoggerInterceptor());
  // dio.interceptors.add(ref.read(refreshTokenInterceptor));
  dio.interceptors.add(ExceptionInterceptor());
  return dio;
});

final authDioServiceProvider = Provider((ref) {
  final dio = Dio(_baseOptions);
  dio.interceptors.add(LoggerInterceptor());
  dio.interceptors.add(ExceptionInterceptor());
  return dio;
});
