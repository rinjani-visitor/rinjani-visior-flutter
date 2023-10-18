import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioServiceProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 5),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5)));
  return dio;
});
