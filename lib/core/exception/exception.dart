/// Extended exception
class ExtException implements Exception {
  final String? message;
  ExtException(this.message);

  @override
  String toString() {
    return message ?? "";
  }
}
