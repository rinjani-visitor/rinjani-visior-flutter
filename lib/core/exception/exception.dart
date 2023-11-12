/// Extended exception, this should be used instead of generic exception
class ExtException implements Exception {
  final String? message;
  final int? code;
  ExtException({this.message, this.code});
  @override
  String toString() {
    return message ?? "";
  }
}
