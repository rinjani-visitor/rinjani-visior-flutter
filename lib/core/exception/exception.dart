import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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

  ExtException({
    required this.exceptionType,
    this.message,
    this.errorMessage,
    this.code,
  });

  @override
  String toString() {
    developer.log("$message || $errorMessage", name: "ExtException.toString");
    if (errorMessage == null || errorMessage!.isEmpty) return "$message";
    return "$errorMessage";
  }

  /// utility function for converting various exception into [ExtException] class
  ///
  /// [ExtException] is a custom exception class that directly return exception
  /// message when convert using `toString` method. this class is really useful for
  /// create error message at flutter pages / screen using toast or equivalent
  /// without default "Exception:" text _shenaigans_.
  factory ExtException.fromDioException(Object exception) {
    developer.log("Raw Error Catched",
        name: "ExtException.fromDioException", error: exception);
    var message = "";
    try {
      if (exception is DioException) {
        // parse errors from List<String> to "string, string2, etc"
        final errors =
            (exception.response?.data["errors"] as List<dynamic>?);
            final stringifyErrors = errors?.map((e) => e.toString()).toList();
        final errorsFull = stringifyErrors != null ? stringifyErrors.join(", ") : "";
        String errorMessage = errorsFull;
        developer.log(errorMessage,
            name: "ExtException.fromDioException", error: exception);
        var code = exception.response?.statusCode;
        ExceptionType exceptionType = ExceptionType.unrecognizedException;
        switch (exception.type) {
          case DioExceptionType.connectionTimeout:
            errorMessage += "Connection Timeout, cant reach server";
            exceptionType = ExceptionType.connectTimeoutException;
            break;
          case DioExceptionType.receiveTimeout:
            errorMessage += "Receive Timeout, it might be server problem";
            exceptionType = ExceptionType.receiveTimeoutException;
            break;
          case DioExceptionType.sendTimeout:
            errorMessage += "Send Timeout";
            exceptionType = ExceptionType.sendTimeoutException;
            break;
          case DioExceptionType.connectionError:
            errorMessage += "Connection Error, Device is Offline";
            exceptionType = ExceptionType.socketException;
            break;
          case DioExceptionType.badResponse:
            exceptionType = ExceptionType.badResponseException;
            break;
          case DioExceptionType.cancel:
            exceptionType = ExceptionType.cancelException;
            break;
          case DioExceptionType.badCertificate:
            errorMessage += "Bad Certificate (?)";
            exceptionType = ExceptionType.unrecognizedException;
            break;
          case DioExceptionType.unknown:
            if (exception.response?.headers.value("code") == null) {
              errorMessage +=
                  exception.response?.data["message"].toString() ?? 'Unknown';
              exceptionType = ExceptionType.unrecognizedException;
            }
            break;
          default:
            exceptionType = ExceptionType.unrecognizedException;
            break;
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
