import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/services/dio_service.dart';
import 'package:rinjani_visitor/features/authentication/data/source/local.dart';
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart';

import 'package:rinjani_visitor/features/authentication/domain/auth_repository.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/login_request.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/register_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalSource localSource;
  final AuthRemoteSource remoteSource;

  static final provider = Provider((ref) => AuthRepositoryImpl(
      localSource: ref.read(AuthLocalSource.provider),
      remoteSource: AuthRemoteSource(ref.read(dioServiceProvider))));

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
      await remoteSource
          .register(const RegisterRequest(username: "name", email: "email"));
    } catch (e) {
      switch (e.runtimeType) {
        case DioException:
          final res = (e as DioException).response;
          debugPrint(
              "Error occured: ${res?.statusCode} - ${res?.statusMessage}");
          rethrow;
          break;

        case Exception:
          final res = (e as Exception).toString();
          debugPrint("Error occured: $res");
          rethrow;
          break;
        default:
          rethrow;
          break;
      }
    }
  }

  @override
  Future<void> logIn({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      final exception = Exception("Email / password should not be null");
      throw exception;
    }

    try {
      final response =
          await remoteSource.logIn(const LoginRequest(password: "", email: ""));
      debugPrint("Repository: new data from remote: ${response.toString()}");

      final token = response.token;
      if (token == null) {
        throw Exception("login failed");
      }
      await localSource.setToken(token);
    } catch (e) {
      switch (e.runtimeType) {
        case DioException:
          final res = (e as DioException).response;
          debugPrint(
              "Error occured: ${res?.statusCode} - ${res?.statusMessage}");
          rethrow;
          break;

        case Exception:
          final res = (e as Exception).toString();
          debugPrint("Error occured: $res");
          rethrow;
          break;
        default:
          rethrow;
      }
    }
  }
}
