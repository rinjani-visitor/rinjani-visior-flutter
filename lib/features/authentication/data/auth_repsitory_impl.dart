import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/core/datastate/remote_state.dart';
import 'package:rinjani_visitor/core/services/dio_service.dart';
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
      remoteSource: AuthRemoteSource(dioServiceProvider)));

  AuthRepositoryImpl({required this.localSource, required this.remoteSource});

//========================//

  @override
  Future<void> logout() async {
    await localSource.removeToken();
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
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    // validation
    if (email.isEmpty || password.isEmpty) {
      final exception = Exception("Email / password should not be null");
      throw exception;
    }
    try {
      final remoteResponse =
          await remoteSource.logIn(email: email, password: password);
      debugPrint(
          "Repository: new data from remote: ${remoteResponse.toString()}");

      final token = remoteResponse.token;
      if (token == null) {
        throw Exception("login failed");
      }
      await localSource.setToken(token);
    } on DioException catch (_) {
      throw Exception("server error");
    } on Exception catch (_) {
      rethrow;
    }
  }
}
