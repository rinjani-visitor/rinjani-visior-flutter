import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/data/source/local.dart';
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_repository.dart';

//TODO: this methods should return classModel, not data state
class AuthRepositoryImpl implements AuthRepository {
  // final String remoteSource;
  final AuthLocalSource localSource;
  final AuthRemoteSource remoteSource;

  static final provider = Provider((ref) => AuthRepositoryImpl(
      localSource: ref.read(AuthLocalSource.provider),
      remoteSource: ref.read(AuthRemoteSource.provider)));

  AuthRepositoryImpl({required this.localSource, required this.remoteSource});

  @override
  Future<LocalState<String>> saveSession(String token) async {
    try {
      await localSource.setToken(token);
      return LocalResult(token);
    } on Exception catch (e) {
      return LocalError(e);
    }
  }

  @override
  Future<LocalState<String>> clearSession() async {
    try {
      await localSource.setToken("");
      return const LocalResult("");
    } on Exception catch (e) {
      return LocalError(e);
    }
  }

  @override
  Stream<LocalState<String>> register(
      String email, String password, String password2) async* {
    yield const LocalLoading();
    try {
      final data =
          await remoteSource.register(email: email, password: password);
      yield LocalResult(data);
    } on Exception catch (e) {
      yield LocalError(e);
    }
  }

  @override
  Stream<LocalState<String>> logIn(String email, String password) async* {
    yield const LocalLoading();
    if (email.isEmpty || password.isEmpty) {
      yield LocalError(Exception("email / password not provided"));
      return;
    }
    try {
      final result = await remoteSource.logIn(email: email, password: password);
      yield LocalResult(result);
    } on Exception catch (e) {
      yield LocalError(e);
    }
  }

  @override
  Future<LocalState<String>> logout() async {
    try {
      await localSource.storage.delete(key: AuthLocalSource.TOKEN_KEY);
      return const LocalResult("success");
    } on Exception catch (e) {
      return LocalError(e);
    }
  }

  @override
  Future<LocalState<String>> checkSession() async {
    final token = await localSource.getToken();
    return LocalResult(token);
  }

  @override
  Future<LocalState<String>> refreshSession() {
    // TODO: implement refreshSession
    throw UnimplementedError();
  }
}
