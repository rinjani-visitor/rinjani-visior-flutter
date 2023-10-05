import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/data/auth_repsitory_impl.dart';

class AuthController {
  StreamController<LocalState<String>> authState = StreamController();
  final AuthRepositoryImpl repository;
  bool _isStreamAlreadyRunning = false;
  AuthController(this.repository);

  static final provider = Provider<AuthController>((ref) {
    return AuthController(ref.read(AuthRepositoryImpl.provider));
  });
  Future<LocalState<String>> getToken() async {
    await Future.delayed(const Duration(seconds: 2));
    return const LocalResult("data");
  }

  Future<void> logIn(String email, String password) async {
    if (_isStreamAlreadyRunning) {
      return;
    }

    debugPrint("Login emitted");
    _isStreamAlreadyRunning = true;
    try {
      authState.add(const LocalLoading());
      await repository.login(email: email, password: password);
      authState.add(const LocalResult(""));
    } on Exception catch (e) {
      //TODO: workaround for avoid login error
      authState.add(LocalError(e));
    }
    _isStreamAlreadyRunning = false;
  }

  Future<LocalState<String>> logOut() async {
    try {
      await repository.logout();
      return const LocalResult("");
    } on Exception catch (e) {
      return LocalError(e);
    }
  }

  Future<void> register(String username, String email, String country,
      String phone, String password, String password2) async {
    if (_isStreamAlreadyRunning) {
      return;
    }
    _isStreamAlreadyRunning = true;

    authState.add(const LocalLoading());
    try {
      await repository.register(
          username: username,
          email: email,
          country: country,
          phone: phone,
          password: password);
      authState.add(const LocalResult("done"));
    } on Exception catch (e) {
      authState.add(LocalError(e));
    }
    _isStreamAlreadyRunning = false;
  }
}
