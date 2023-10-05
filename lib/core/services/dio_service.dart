import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RequestType { post, get, delete, put }

final _baseUrl = "https://rinjanispecapi-tpe6yyswta-as.a.run.app/api/v1";

final dioServiceProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      receiveTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5)));
  return dio;
});
