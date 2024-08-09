abstract class DataState<T> {
  final T? data;
  final bool status;
  final String message;

  const DataState({
    this.data,
    this.status = false,
    this.message = '',
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({bool status = false, String message = 'error'})
      : super(status: status, message: message);
}
