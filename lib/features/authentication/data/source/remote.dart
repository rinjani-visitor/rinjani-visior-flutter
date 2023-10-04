import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/remote_state.dart';
import 'package:rinjani_visitor/core/services/dio_service.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';

class AuthRemoteSource {
  final DioService dioService;

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
      final response = await dioService.client.post("/login", data: body);
      final result = AuthModel.fromJson(response.data);
      return RemoteResult(result);
    } on DioException catch (e) {
      return RemoteError(e);
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
      final response = await dioService.client.post("/register", data: body);
      final result = AuthModel.fromJson(response.data);
      return RemoteResult(result);
    } on DioException catch (e) {
      return RemoteError(e);
    }
  }
}
