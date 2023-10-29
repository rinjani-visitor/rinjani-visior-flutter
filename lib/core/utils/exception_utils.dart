import 'package:dio/dio.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';

/// utility function for converting various exception into [ExtException] class
///
/// [ExtException] is a custom exception class that directly return exception
/// message when convert using `toString` method. this class is really useful for
/// create error message at flutter pages / screen using toast or equivalent
/// without `Exception:` text _shenaigans_.
ExtException exceptionHandler(Object exception) {
  if (exception is DioException) {
    return ExtException(exception.message);
  }
  return ExtException(exception.toString());
}
