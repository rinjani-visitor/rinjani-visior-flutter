// ignore_for_file: constant_identifier_names
import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/login.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/register.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/reset.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/update_user_detail.dart';
import 'package:rinjani_visitor/features/authentication/data/source/local.dart';
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth_detail.dart';
import 'package:rinjani_visitor/features/authentication/domain/repo/auth.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(
    local: ref.read(authLocalSourceProvider),
    remote: AuthRemoteSource(ref.read(dioServiceProvider))));

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalSource local;
  final AuthRemoteSource remote;
  static const NAME = "AuthRepository";

  AuthRepositoryImpl({required this.local, required this.remote});

  @override
  Future<AuthEntity?> logout() async {
    await local.clearSession();
    return null;
  }

  @override
  Future<AuthEntity?> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password}) async {
    developer.log("$NAME: Register...");

    developer.log(
        "values: email - $email, country - $country, phone - $phone, password - ${password.isNotEmpty}");
    final request = RegisterRequest(
        name: username,
        email: email,
        country: country,
        password: password,
        confirmPassword: password,
        phone: phone);
    final response = await remote.register(request);
    developer.log("Repository: data from remote: ${response.toString()}");
    if (response.data == null) return null;
    return response.data!.toEntity();
  }

  @override
  Future<AuthEntity?> logIn(
      {required String email, required String password}) async {
    developer.log("$NAME: Login..., email $email password $password");

    final response = await remote
        .logIn(LoginRequest(password: password, email: email));
    developer.log("Repository: new data from remote: ${response.toString()}");
    final result = response.toEntity();
    developer.log("Repository: entity: ${result.toString()}");
    await local.setSession(result.accessToken!, result.refreshToken!);
    return result;
  }

  @override
  Future<AuthEntity?> getSavedSession() async {
    final sessionModel = await local.getSession();
    if (sessionModel == null) return null;

    return AuthEntity(
        accessToken: sessionModel.accessToken,
        refreshToken: sessionModel.refreshToken);
  }

  @override
  Future<AuthEntity?> refresh(AuthEntity? entity) async {
    developer.log("$NAME: Refresh...");

    final authdata = await getSavedSession();
    developer.log("AccessToken : ${authdata?.accessToken}");
    developer.log("RefreshToken : ${authdata?.toRefreshTokenAuthorization()}");
    final response =
        await remote.refresh(authdata!.toRefreshTokenAuthorization());
    developer.log("NewAccessToken : ${response.accessToken}",
        name: runtimeType.toString());
    authdata.accessToken = response.accessToken;
    developer.log("authEntity : ${authdata.toString()}",
        name: runtimeType.toString());
    await local.setSession(response.accessToken!, response.refreshToken!);
    final data = response.toEntity();
    return data;
  }

  @override
  Future<AuthDetailEntity?> getUserDetail(
      String accessToken, String userId) async {
    developer.log("Get user detail", name: runtimeType.toString());

    final data = await remote.getUserDetail(accessToken);
    final result = data.toEntity();
    return result;
  }

  @override
  Future<String?> resetPassword({required String email}) async {
    final data = await remote.resetPassword(ResetRequest(email: email));
    final result = data.message;
    return result;
  }

  @override
  Future<bool?> uploadAvatar(String accessToken, File file) async {
    developer.log("Upload avatar with file ${file.path}",
        name: runtimeType.toString());
    final result = await remote.uploadAvatar(accessToken, file);
    if (result.errors != null) {
      return true;
    }
    return false;
  }

  @override
  Future<void> updateUserDetail(
    String accessToken,
    String userId, {
    String? phoneNumber,
    String? password,
    String? confirmPassword,
  }) async {
    final body = UpdateUserDetailRequest(
      phoneNumber: phoneNumber,
      password: password,
      confirmPassword: confirmPassword,
    );
    final data = await remote.updateUserDetail(accessToken, body);
  }
}
