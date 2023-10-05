import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/remote_state.dart';
import 'package:rinjani_visitor/core/services/dio_service.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';

class AuthRemoteSource {
  final Dio dioService;

  AuthRemoteSource(this.dioService);
  static final provider = Provider((ref) {
    return AuthRemoteSource(ref.read(dioServiceProvider));
  });

//==========//

  Future<RemoteState<AuthModel>> logIn(
      {required String email, required String password}) async {
    // bool enableError = false;
    // await Future.delayed(const Duration(seconds: 2));
    // if (enableError == true) {
    //   throw Exception("login failed");
    // }
    // return "thisistoken";
    try {
      final body = {
        "email": email,
        "password": password,
      };
      debugPrint("login post");
      Response response = await dioService.post("/login", data: body);
      final result = AuthModel.fromJson(response.data);
      debugPrint("login with new data: ${result.toString()}");
      return RemoteResult(result);
    } catch (e) {
      if (e is DioException) {
        return RemoteError(e);
      }
      return RemoteError(DioException.connectionTimeout(
          timeout: Duration(seconds: 5), requestOptions: RequestOptions()));
    }
  }

  Future<RemoteState<AuthModel>> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password}) async {
    try {
      final body = {
        "username": username,
        "email": email,
        "country": country,
        "phone": phone,
        "password": password,
      };
      debugPrint("get");
      final response = await dioService.post("/register", data: body);
      final result = AuthModel.fromJson(response.data);
      return RemoteResult(result);
    } catch (e) {
      if (e is DioException) {
        return RemoteError(e);
      }
      return RemoteError(DioException.connectionTimeout(
          timeout: const Duration(seconds: 5),
          requestOptions: RequestOptions()));
    }
  }
}
