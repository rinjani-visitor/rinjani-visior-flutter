import 'package:dio/dio.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';

/// function for handling various exception into `LocalError` class
LocalError<T> exceptionHandler<T>(Object exception) {
  switch (exception.runtimeType) {
    case DioException:
      final message = (exception as DioException).message;
      return LocalError(Exception(message));
    case Exception:
      return LocalError(exception as Exception);
    default:
      return LocalError(Exception());
  }
}
