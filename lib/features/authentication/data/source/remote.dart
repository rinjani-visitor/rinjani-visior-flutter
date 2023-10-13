import 'dart:io';

import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';

import 'package:rinjani_visitor/features/authentication/domain/data/remote/request/login_request.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/request/register_request.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/response/login_response.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/response/register_response.dart';

part 'remote.g.dart';

@RestApi(baseUrl: restApiBaseUrl)
abstract class AuthRemoteSource {
  factory AuthRemoteSource(Dio dio, {String? baseUrl}) = _AuthRemoteSource;

  @POST("login")
  Future<LoginResponse> logIn(@Body() LoginRequest body);

  @POST('register')
  Future<RegisterResponse> register(@Body() RegisterRequest body);
}
