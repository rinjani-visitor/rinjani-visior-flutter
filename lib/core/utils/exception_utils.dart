import 'package:dio/dio.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';

/// utility function for converting various exception into [ExtException] class
ExtException exceptionHandler(Object exception) {
  if (exception is DioException) {
    return ExtException(exception.message);
  }
  return ExtException(exception.toString());
}
