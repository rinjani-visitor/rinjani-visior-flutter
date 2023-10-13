import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/core/services/dio_service.dart';
import 'package:rinjani_visitor/core/utils/exception_utils.dart';
import 'package:rinjani_visitor/features/authentication/data/source/local.dart';
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';

import 'package:rinjani_visitor/features/authentication/domain/auth_repository.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/request/login_request.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/request/register_request.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/response/basic_response.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/response/login_response.dart';

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
  Future<AuthModel> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password}) async {
    debugPrint("${NAME}: Register...");

    if (username.isEmpty ||
        email.isEmpty ||
        country.isEmpty ||
        phone.isEmpty ||
        password.isEmpty) {
      debugPrint(
          "values: email - $email, country - $country, phone - $phone, password - $password");
      throw Exception("field must not be empty");
    }

    try {
      final response = await remoteSource
          .register(const RegisterRequest(username: "name", email: "email"));
      debugPrint("Repository: new data from remote: ${response.toString()}");
      return AuthModel(
          userId: response.userId!,
          username: response.userId!,
          email: response.email!);
    } catch (e) {
      rethrow;
      // return exceptionHandler<AuthModel>(e);
    }
  }

  @override
  Future<AuthModel> logIn(
      {required String email, required String password}) async {
    debugPrint("${NAME}: Login...");

    if (email.isEmpty || password.isEmpty) {
      final exception = Exception("Email / password should not be null");
      debugPrint("${NAME}: Error: ${exception.toString()}");

      throw exception;
    }

    try {
      final response = await remoteSource
          .logIn(LoginRequest(password: password, email: email));
      debugPrint("Repository: new data from remote: ${response.toString()}");
      final loginResult = response.loginResult!;
      await localSource.setToken(loginResult.token.toString());
      return AuthModel(
          userId: loginResult.userId,
          email: loginResult.email,
          token: loginResult.token);
    } catch (e) {
      if (e is DioException) {
        debugPrint("DioException, response: ${e.response?.data.toString()}");
        throw Exception(BasicResponse.fromJson(e.response?.data).message);
      }
      debugPrint("Repository: error: ${e.toString()}");
      rethrow;
      // return exceptionHandler<AuthModel>(e);
    }
  }

  @override
  Future<AuthModel> getSavedSession() async {
    final stringJson = await localSource.getToken();
    try {
      final authModel = AuthModel.fromJson(jsonDecode(stringJson));
      return authModel;
    } catch (e) {
      return const AuthModel();
    }
  }

  static const NAME = "AuthRepository";
}
