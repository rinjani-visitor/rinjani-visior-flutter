import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/data/auth_repsitory_impl.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';

class AuthRiverpod {
  static const JWT_TOKEN = 'jwt_token';
  final AuthRepositoryImpl repository;
  AuthRiverpod(this.repository);

  static final provider = Provider<AuthRiverpod>((ref) {
    return AuthRiverpod(ref.read(AuthRepositoryImpl.provider));
  });

  @override
  Future<String> getToken() async {
    // TODO: keep this function until API specs is provided
    // Simulate get token behaviour when get data from API
    return Future.delayed(
      const Duration(seconds: 3),
      () => "",
    );
  }

  void loginWithGoogle() {
    // TODO: implement loginWithGoogle
  }

  Future<LocalState<String>> logIn(String email, String password) async {
    try {
      await repository.logIn(email, password);
      return const LocalResult("login success");
    } on Exception catch (e) {
      return LocalError(e);
    }
  }

  Future<LocalState<String>> logout() async {
    try {
      await repository.logout();
      return const LocalResult("");
    } on Exception catch (e) {
      return LocalError(e);
    }
  }

  Future<LocalState<String>> register(
      String email, String password, String password2) async {
    try {
      final result = await repository.register(email, password, password2);
      return LocalResult(result);
    } on Exception catch (e) {
      return LocalError(e);
    }
  }
}
