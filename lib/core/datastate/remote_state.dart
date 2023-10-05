import 'package:dio/dio.dart';

abstract class RemoteState<T> {
  final T? data;
  final DioException? error;
  const RemoteState({this.data, this.error});
}

class RemoteLoading<T> extends RemoteState<T> {
  const RemoteLoading();
}

class RemoteResult<T> extends RemoteState<T> {
  const RemoteResult(T data) : super(data: data);
}

class RemoteError<T> extends RemoteState<T> {
  const RemoteError(DioException error) : super(error: error);
}
