abstract class DataState<T> {
  final T? data;
  final Error? error;
  const DataState({this.data, this.error});
}

class DataResult<T> extends DataState<T> {
  const DataResult(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  const DataError(Error error) : super(error: error);
}
