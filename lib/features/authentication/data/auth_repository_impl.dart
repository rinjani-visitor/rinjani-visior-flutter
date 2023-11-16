// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/core/presentation/utils/exception_utils.dart';
import 'package:rinjani_visitor/features/authentication/data/source/local.dart';
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart';
import 'package:rinjani_visitor/features/authentication/data/models/auth_model.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/login_request.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/register_request.dart';
import 'package:rinjani_visitor/features/authentication/domain/repo/auth_repository.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(
    localSource: ref.read(AuthLocalSource.provider),
    remoteSource: AuthRemoteSource(ref.read(dioServiceProvider))));

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalSource localSource;
  final AuthRemoteSource remoteSource;

  AuthRepositoryImpl({required this.localSource, required this.remoteSource});

  @override
  Future<Auth?> logout() async {
    await localSource.clearSession();
    return null;
  }

  @override
  Future<Auth> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password}) async {
    debugPrint("$NAME: Register...");

    try {
      debugPrint(
          "values: email - $email, country - $country, phone - $phone, password - ${password.isNotEmpty}");
      final response = await remoteSource.register(RegisterRequest(
          username: username,
          email: email,
          country: country,
          password: password,
          phone: phone));
      debugPrint("Repository: data from remote: ${response.toString()}");
      return Auth(
          userId: response.user?.userId!,
          username: response.user?.username!,
          email: response.user?.email!);
    } catch (e) {
      throw exceptionHandler(e);
    }
  }

  @override
  Future<Auth> logIn({required String email, required String password}) async {
    debugPrint("$NAME: Login...");
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
      return result.toEntity();
    } catch (e) {
      final err = exceptionHandler(e);
      debugPrint("$NAME: Error: ${err.toString()}");
      throw err;
    }
  }

  @override
  Future<Auth?> getSavedSession() async {
    final sessionModel = await localSource.getSession();
    try {
      debugPrint("$NAME : $sessionModel");
      return sessionModel?.toEntity();
    } catch (e) {
      throw exceptionHandler(e);
    }
  }

  static const NAME = "AuthRepository";
}
