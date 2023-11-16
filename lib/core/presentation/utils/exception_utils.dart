import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';

/// utility function for converting various exception into [ExtException] class
///
/// [ExtException] is a custom exception class that directly return exception
/// message when convert using `toString` method. this class is really useful for
/// create error message at flutter pages / screen using toast or equivalent
/// without `Exception:` text _shenaigans_.
ExtException exceptionHandler(Object exception) {
  debugPrint("Exception Catched: ${exception.toString()}");
  var message = "";
  if (exception is DioException) {
    var code = exception.response?.statusCode;
    message = "${exception.response?.data["message"].toString()}";
    if (exception.type == DioExceptionType.connectionError) {
      if (code != null && code >= 500) {
        message = "$code Server Error, ${exception.response?.statusMessage}";
      }
      message = "Connection Error, Device is Offline";
    }
    return ExtException(message: message, code: code);
  }
  return ExtException(message: exception.toString());
}
