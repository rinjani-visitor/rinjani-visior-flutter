import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRemoteSource {
  static final provider = Provider((ref) => AuthRemoteSource());

  Future<String> logIn(
      {required String email,
      required String password,
      bool? enableError = false}) async {
    await Future.delayed(Duration(seconds: 2));
    if (enableError != null && enableError) {
      throw Exception("login failed");
    }
    return "thisistoken";
  }
}
