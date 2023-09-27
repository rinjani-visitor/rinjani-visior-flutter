import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/data/auth_repsitory_impl.dart';

class AuthRiverpod {
  // ignore: constant_identifier_names
  static const JWT_TOKEN = 'jwt_token';

  StreamController<LocalState<String>> loginStatus = StreamController()
    ..add(const LocalInit());
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

  Future<void> logIn(String email, String password) async {
    loginStatus.add(const LocalLoading());
    debugPrint("${this.toString()} - Loading");
    final data = await repository.logIn(email, password);
    loginStatus.add(data);
    debugPrint("${this.toString()} - Done: ${loginStatus.toString()}");
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
