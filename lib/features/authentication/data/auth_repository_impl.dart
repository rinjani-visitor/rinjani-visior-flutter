// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/authentication/data/source/local.dart';
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/login_request.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/register_request.dart';
import 'package:rinjani_visitor/features/authentication/domain/repo/auth_repository.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(
    localSource: ref.read(authLocalSourceProvider),
    remoteSource: AuthRemoteSource(ref.read(dioServiceProvider))));

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalSource localSource;
  final AuthRemoteSource remoteSource;

  AuthRepositoryImpl({required this.localSource, required this.remoteSource});

  @override
  Future<AuthEntity?> logout() async {
    await localSource.clearSession();
    return null;
  }

  @override
  Future<AuthEntity?> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password}) async {
    debugPrint("$NAME: Register...");

    try {
      debugPrint(
          "values: email - $email, country - $country, phone - $phone, password - ${password.isNotEmpty}");
      final request = RegisterRequest(
          username: username,
          email: email,
          country: country,
          password: password,
          confirmPassword: password,
          phone: phone);
      final response = await remoteSource.register(request);
      debugPrint("Repository: data from remote: ${response.toString()}");
      if (response.data == null) return null;
      return response.data!.toEntity();
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<AuthEntity?> logIn(
      {required String email, required String password}) async {
    debugPrint("$NAME: Login..., email $email password $password");
    try {
      final response = await remoteSource
          .logIn(LoginRequest(password: password, email: email));
      debugPrint("Repository: new data from remote: ${response.toString()}");
      final result = response.toEntity();
      debugPrint("Repository: entity: ${result.toString()}");
      await localSource.setSession(result.accessToken!, result.refreshToken!);
      return result;
    } on Exception catch (e) {
      final err = ExtException.fromDioException(e);
      throw err;
    }
  }

  @override
  Future<AuthEntity?> getSavedSession() async {
    final sessionModel = await localSource.getSession();
    if (sessionModel == null) return null;
    try {
      return AuthEntity(
          accessToken: sessionModel.accessToken,
          refreshToken: sessionModel.refreshToken);
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<AuthEntity> refresh(AuthEntity? entity) async {
    try {
      final authdata = entity ?? await getSavedSession();
      final newAccessToken =
          await remoteSource.refresh(authdata!.toRefreshTokenAuthorization());
      final newAuthData = authdata.copyWith(accessToken: newAccessToken.data);
      await localSource.setSession(
          newAuthData.accessToken, newAuthData.refreshToken);
      return newAuthData;
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  static const NAME = "AuthRepository";
}
