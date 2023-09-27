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
  Future<String> getToken() async {
    final token = await localSource.getToken();
    return token;
  }

  void setToken(String token) {
    localSource.saveToken(token);
  }

  @override
  Future<LocalState<String>> logIn(String email, String password) async {
    try {
      final result = await remoteSource.logIn(email: email, password: password);
      return LocalResult(result);
    } on Exception catch (e) {
      return LocalError(e);
    }
  }

  @override
  Future<String> logout() async {
    await Future.delayed(const Duration(seconds: 3));
    await localSource.storage.delete(key: AuthLocalSource.TOKEN_KEY);
    return "data done";
  }

  @override
  Future<String> register(
      String email, String password, String password2) async {
    await Future.delayed(const Duration(seconds: 3));
    return "";
  }
}
