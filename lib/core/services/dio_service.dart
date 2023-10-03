import 'package:dio/dio.dart';

class DioService {
  late Dio _client;
  Dio get client => _client;

  DioService() {
    final dioOptions = BaseOptions(
      baseUrl: "http://localhost",
    );
    _client = Dio(dioOptions);
  }

  callApi({required String endpoint}) {}
}
