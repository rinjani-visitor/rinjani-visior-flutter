abstract class LocalState<T> {
  final T? data;
  final Exception? error;
  const LocalState({this.data, this.error});
}

class LocalLoading<T> extends LocalState<T> {
  const LocalLoading();
}

class LocalResult<T> extends LocalState<T> {
  const LocalResult(T data) : super(data: data);
}

class LocalError<T> extends LocalState<T> {
  const LocalError(Exception error) : super(error: error);
}
