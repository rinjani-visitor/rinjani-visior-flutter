import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/data/auth_repsitory_impl.dart';

class AuthRiverpod {
  StreamController<LocalState<String>> authState = StreamController();
  final AuthRepositoryImpl repository;
  AuthRiverpod(this.repository);

  static final provider = Provider<AuthRiverpod>((ref) {
    return AuthRiverpod(ref.read(AuthRepositoryImpl.provider));
  });

  Future<LocalState<String>> getToken() async {
    final data = await repository.checkSession();
    return data;
  }

  Future<void> logIn(String email, String password) async {
    authState.addStream(repository.logIn(email, password));
  }

  Future<LocalState<String>> logOut() async {
    try {
      await repository.logout();
      return const LocalResult("");
    } on Exception catch (e) {
      return LocalError(e);
    }
  }

  Future<void> register(String email, String password, String password2) async {
    authState.addStream(repository.register(email, password, password2));
  }
}
