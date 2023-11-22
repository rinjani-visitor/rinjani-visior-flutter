
class BaseResponse<T> {
  final List<String>? errors;
  final String message;
  final T data;
  const BaseResponse({required this.errors, required this.message, required this.data});
}