// ignore_for_file: constant_identifier_names
import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/reset.dart';
import 'package:rinjani_visitor/features/authentication/data/source/local.dart';
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/login.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/register.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth_detail.dart';
import 'package:rinjani_visitor/features/authentication/domain/repo/auth_repository.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(
    localSource: ref.read(authLocalSourceProvider),
    remoteSource: AuthRemoteSource(ref.read(dioServiceProvider))));

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalSource localSource;
  final AuthRemoteSource remoteSource;
  static const NAME = "AuthRepository";

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
    developer.log("$NAME: Register...");

    try {
      developer.log(
          "values: email - $email, country - $country, phone - $phone, password - ${password.isNotEmpty}");
      final request = RegisterRequest(
          username: username,
          email: email,
          country: country,
          password: password,
          confirmPassword: password,
          phone: phone);
      final response = await remoteSource.register(request);
      developer.log("Repository: data from remote: ${response.toString()}");
      if (response.data == null) return null;
      return response.data!.toEntity();
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<AuthEntity?> logIn(
      {required String email, required String password}) async {
    developer.log("$NAME: Login..., email $email password $password");
    try {
      final response = await remoteSource
          .logIn(LoginRequest(password: password, email: email));
      developer.log("Repository: new data from remote: ${response.toString()}");
      final result = response.toEntity();
      developer.log("Repository: entity: ${result.toString()}");
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
  Future<AuthEntity?> refresh(AuthEntity? entity) async {
    developer.log("$NAME: Refresh...");
    try {
      final authdata = await getSavedSession();
      developer.log("AccessToken : ${authdata?.accessToken}");
      developer
          .log("RefreshToken : ${authdata?.toRefreshTokenAuthorization()}");
      final response =
          await remoteSource.refresh(authdata!.toRefreshTokenAuthorization());
      developer.log("NewAccessToken : ${response.accessToken}",
          name: runtimeType.toString());
      authdata.accessToken = response.accessToken;
      developer.log("authEntity : ${authdata.toString()}",
          name: runtimeType.toString());
      await localSource.setSession(response.accessToken, response.refreshToken);
      final data = response.toEntity();
      return data;
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<AuthDetailEntity?> getUserDetail(String accessToken) async {
    developer.log("Get user detail", name: runtimeType.toString());
    try {
      final data = await remoteSource.getUserDetail(accessToken);
      final result = data.toEntity();
      return result;
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<String?> resetPassword({required String email}) async {
    try {
      final data = await remoteSource.resetPassword(ResetRequest(email: email));
      final result = data.message;
      return result;
    } catch (e) {
      final error = ExtException.fromDioException(e);
      return "Failed: ${error.errorMessage}";
    }
  }

  @override
  Future<bool?> uploadAvatar(String accessToken, File file) async {
    try {
      developer.log("Upload avatar with file ${file.path}",
          name: runtimeType.toString());
      final result = await remoteSource.uploadAvatar(accessToken, file);
      if (result.errors != null) {
        return true;
      }
      return false;
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }
}
