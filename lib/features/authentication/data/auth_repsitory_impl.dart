import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/core/datastate/remote_state.dart';
import 'package:rinjani_visitor/features/authentication/data/source/local.dart';
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_repository.dart';

//TODO: this methods should return classModel, not data state
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalSource localSource;
  final AuthRemoteSource remoteSource;

  static final provider = Provider((ref) => AuthRepositoryImpl(
      localSource: ref.read(AuthLocalSource.provider),
      remoteSource: ref.read(AuthRemoteSource.provider)));

  AuthRepositoryImpl({required this.localSource, required this.remoteSource});

//========================//

  @override
  Future<void> logout() async {
    await localSource.storage.delete(key: AuthLocalSource.TOKEN_KEY);
  }

  @override
  Future<void> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password}) async {
    if (username.isEmpty ||
        email.isEmpty ||
        country.isEmpty ||
        phone.isEmpty ||
        password.isEmpty) {
      throw Exception("field must not be empty");
    }
    try {
      final response = await remoteSource.register(
          username: username,
          country: country,
          phone: phone,
          email: email,
          password: password);
      final body = response.data;
      if (body == null) {
        throw Exception("Body is empty");
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<LocalState<AuthModel>> login(
      {required String email, required String password}) async {
    // validation
    if (email.isEmpty || password.isEmpty) {
      final exception = Exception("Email / password should not be null");
      return LocalError(exception);
    }
    try {
      final remoteResponse =
          await remoteSource.logIn(email: email, password: password);
      debugPrint(
          "Repository: new data from remote: ${remoteResponse.data?.toString()}");
      if (remoteResponse is RemoteError && remoteResponse.error != null) {
        final exception = remoteResponse.error!;
        throw exception;
      }
      final token = remoteResponse.data?.token;
      if (token == null) {
        return LocalError(Exception("login failed"));
      }
      await localSource.setToken(token);
      return LocalResult(remoteResponse.data!);
    } on DioException catch (_) {
      throw Exception("server error");
    } on Exception catch (_) {
      rethrow;
    }
  }
}
