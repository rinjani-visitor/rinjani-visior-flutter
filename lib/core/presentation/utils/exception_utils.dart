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
    DioExceptionType? type = exception.type;
    switch (type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection Timeout";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive Timeout";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send Timeout";
        break;
      case DioExceptionType.connectionError:
        message = "Connection Error, Device is Offline";
        break;
      case DioExceptionType.badResponse:
        message =
            "Bad response, ${exception.response?.data["message"].toString()}";
        break;
      case DioExceptionType.cancel:
        message = "Request Cancelled";
        break;
      default:
        message = "${exception.response?.data["message"].toString()}";
    }
    var code = exception.response?.statusCode;
    if (code != null && code >= 500) {
      message = "$code Server Error, ${exception.response?.statusMessage}";
    }
    return ExtException(message: message, code: code);
  }
  return ExtException(message: exception.toString());
}
