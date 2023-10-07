import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/data/auth_repsitory_impl.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';

class AuthController {
  final AuthRepositoryImpl repository;
  AuthController(this.repository);

  static final provider = Provider<AuthController>((ref) {
    return AuthController(ref.read(AuthRepositoryImpl.provider));
  });
  Future<LocalState<String>> getToken() async {
    await Future.delayed(const Duration(seconds: 2));
    return const LocalResult("data");
  }

  Future<LocalState<AuthModel>> logIn(String email, String password) async {
    debugPrint("Login emitted");
    final result = repository.logIn(email: email, password: password);
    return result;
  }

  Future<LocalState<String>> logOut() async {
    try {
      await repository.logout();
      return const LocalResult("");
    } on Exception catch (e) {
      return LocalError(e);
    }
  }

  Future<LocalState<AuthModel>> register(String username, String email,
      String country, String phone, String password, String password2) async {
    final result = repository.register(
        username: username,
        email: email,
        country: country,
        phone: phone,
        password: password);
    return result;
  }
}
