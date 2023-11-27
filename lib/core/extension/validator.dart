extension StringValidation on String {
  bool isEmailValid() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isExist() {
    return isNotEmpty;
  }
}

extension ListValidation on List {
  /// Check if list is not empty
  bool isExist() {
    return isNotEmpty;
  }
}

extension NullValidation on Null {
  /// Check if null is not a null (redundant, i know)
  bool isExist() {
    return this != null;
  }
}
