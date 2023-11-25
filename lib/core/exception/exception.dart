import 'dart:developer' as developer;
import 'package:dio/dio.dart';

enum ExceptionType {
  /// The exception for a bad response from the api.
  badResponseException,

  /// The exception for an expired bearer token.
  tokenExpiredException,

  /// The exception for a prematurely cancelled request.
  cancelException,

  /// The exception for a failed connection attempt.
  connectTimeoutException,

  /// The exception for failing to send a request.
  sendTimeoutException,

  /// The exception for failing to receive a response.
  receiveTimeoutException,

  /// The exception for no internet connectivity.
  socketException,

  /// A better name for the socket exception.
  fetchDataException,

  /// The exception for an incorrect parameter in a request/response.
  formatException,

  /// The exception for an unknown type of failure.
  unrecognizedException,

  /// The exception for an unknown exception from the api.
  apiException,

  /// The exception for any parsing failure encountered during
  /// serialization/deserialization of a request.
  serializationException,
}

/// Extended exception, this should be used instead of generic exception
class ExtException implements Exception {
  final String? message;
  final String? errorMessage;
  final int? code;
  final ExceptionType exceptionType;
  ExtException(
      {required this.exceptionType,
      this.message,
      this.errorMessage,
      this.code});
  @override
  String toString() {
    return "$message";
  }

  /// utility function for converting various exception into [ExtException] class
  ///
  /// [ExtException] is a custom exception class that directly return exception
  /// message when convert using `toString` method. this class is really useful for
  /// create error message at flutter pages / screen using toast or equivalent
  /// without `Exception:` text _shenaigans_.
  factory ExtException.fromDioException(Object exception) {
    developer.log("Raw Error Catched",
        name: "ExtException.fromDioException", error: exception);
    var message = "";
    try {
      if (exception is DioException) {
        final String? errorMessage = exception.response?.data["errors"][0];
        var code = exception.response?.statusCode;
        ExceptionType exceptionType = ExceptionType.unrecognizedException;
        switch (exception.type) {
          case DioExceptionType.connectionTimeout:
            message += "Connection Timeout, cant reach server";
            exceptionType = ExceptionType.connectTimeoutException;
            break;
          case DioExceptionType.receiveTimeout:
            message += "Receive Timeout, it might be server problem";
            exceptionType = ExceptionType.receiveTimeoutException;
            break;
          case DioExceptionType.sendTimeout:
            message += "Send Timeout";
            exceptionType = ExceptionType.sendTimeoutException;
            break;
          case DioExceptionType.connectionError:
            message += "Connection Error, Device is Offline";
            exceptionType = ExceptionType.socketException;
            break;
          case DioExceptionType.badResponse:
            message =
                "Bad response, ${exception.response?.data["message"].toString()}";
            exceptionType = ExceptionType.badResponseException;
            break;
          case DioExceptionType.cancel:
            message += "${exception.message}";
            exceptionType = ExceptionType.cancelException;
            break;
          case DioExceptionType.badCertificate:
            message += "Bad Certificate (?)";
            exceptionType = ExceptionType.unrecognizedException;
            break;
          case DioExceptionType.unknown:
            if (exception.response?.headers.value("code") == null) {
              message +=
                  exception.response?.data["message"].toString() ?? 'Unknown';
              exceptionType = ExceptionType.unrecognizedException;
            }
            break;
          default:
            message += "${exception.response?.data["message"].toString()}";
            exceptionType = ExceptionType.unrecognizedException;
        }
        return ExtException(
            exceptionType: exceptionType,
            message: message,
            errorMessage: errorMessage,
            code: code);
      }
    } on Exception catch (e) {
      developer.log("Exception Catched",
          name: "ExtException.fromDioException", error: e);
      return ExtException(
          exceptionType: ExceptionType.unrecognizedException,
          message: e.toString());
    }
    return ExtException(
        exceptionType: ExceptionType.unrecognizedException,
        message: exception.toString());
  }
  factory ExtException.fromParsingException(Exception error) {
    return ExtException(
        exceptionType: ExceptionType.serializationException,
        message: "Failed to parse data, ${error.toString()}");
  }
}
