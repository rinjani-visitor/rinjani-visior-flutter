import 'dart:isolate';

import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';

import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/login_request.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/register_request.dart';

part 'remote.g.dart';

@RestApi(baseUrl: restApiBaseUrl)
abstract class AuthRemoteSource {
  final Dio dioService;

  AuthRemoteSource(this.dioService);

  @POST("/login")
  Future<AuthModel> logIn(@Body() LoginRequest body);

  @POST('/register')
  Future<AuthModel> register(@Body() RegisterRequest body);
}
