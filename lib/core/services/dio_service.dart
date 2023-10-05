import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RequestType { post, get, delete, put }

class DioService {
  final _baseUrl = "https://rinjanispecapi-tpe6yyswta-as.a.run.app/api/v1";
  late final Dio client;

  DioService() {
    client = _createDio();
  }

  Dio _createDio() {
    final dio = Dio(BaseOptions(
        baseUrl: _baseUrl,
        receiveTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5)));
    dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      handler.reject(error);
    }));
    return dio;
  }
}

final dioServiceProvider = Provider((ref) => DioService());
