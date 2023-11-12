// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/core/presentation/utils/exception_utils.dart';
import 'package:rinjani_visitor/features/authentication/data/source/local.dart';
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';

import 'package:rinjani_visitor/features/authentication/domain/auth_repository.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/request/login_request.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/request/register_request.dart';

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
    await localSource.clearSession();
  }

  @override
  Future<AuthModel> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password}) async {
    debugPrint("$NAME: Register...");

    if (username.isEmpty ||
        email.isEmpty ||
        country.isEmpty ||
        phone.isEmpty ||
        password.isEmpty) {
      throw ExtException( message: "field must not be empty");
    }

    try {
      debugPrint(
          "values: email - $email, country - $country, phone - $phone, password - $password");
      final response = await remoteSource.register(RegisterRequest(
          username: username,
          email: email,
          country: country,
          password: password,
          phone: phone));
      debugPrint("Repository: data from remote: ${response.toString()}");
      return AuthModel(
          userId: response.user?.userId!,
          username: response.user?.username!,
          email: response.user?.email!);
    } catch (e) {
      throw exceptionHandler(e);
    }
  }

  @override
  Future<AuthModel> logIn(
      {required String email, required String password}) async {
    debugPrint("$NAME: Login...");
    if (email.isEmpty || password.isEmpty) {
      final exception = ExtException(message: "Email / password should not be null");
      debugPrint("$NAME: Error: ${exception.toString()}");
      throw exception;
    }

    try {
      final response = await remoteSource
          .logIn(LoginRequest(password: password, email: email));
      debugPrint("Repository: new data from remote: ${response.toString()}");
      final loginResult = response.loginResult!;
      final result = AuthModel(
          userId: loginResult.userId,
          email: loginResult.email,
          username: loginResult.username,
          token: loginResult.token);
      await localSource.setSession(result);
      return result;
    } catch (e) {
      final err = exceptionHandler(e);
      debugPrint("$NAME: Error: ${err.toString()}");
      throw err;
    }
  }

  @override
  Future<AuthModel?> getSavedSession() async {
    final sessionModel = await localSource.getSession();
    try {
      debugPrint("$NAME : $sessionModel");
      return sessionModel;
    } catch (e) {
      throw exceptionHandler(e);
    }
  }

  static const NAME = "AuthRepository";
}
