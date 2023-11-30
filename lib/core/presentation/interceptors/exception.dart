import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';

class ExceptionInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log(
      "ERROR Catched",
      error: err.response,
      name: runtimeType.toString(),
    );
    handler.next(ExtException.fromDioException(err));
  }
}
