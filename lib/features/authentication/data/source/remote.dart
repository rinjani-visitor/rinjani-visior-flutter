import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRemoteSource {
  static final provider = Provider((ref) => AuthRemoteSource());

  Future<String> logIn(
      {required String email, required String password}) async {
    bool enableError = false;
    await Future.delayed(const Duration(seconds: 2));
    if (enableError == true) {
      throw Exception("login failed");
    }
    return "thisistoken";
  }

  Future<String> register(
      {required String email, required String password}) async {
    bool errortest = false;
    await Future.delayed(const Duration(seconds: 2));
    if (errortest == true) {
      throw Exception("Register failed");
    }
    return "done";
  }
}
