import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';

import 'package:rinjani_visitor/features/authentication/data/models/request/login_request.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/register_request.dart';
import 'package:rinjani_visitor/features/authentication/data/models/response/login_response.dart';
import 'package:rinjani_visitor/features/authentication/data/models/response/register_response.dart';

part 'remote.g.dart';

@RestApi(baseUrl: restApiBaseUrl)
abstract class AuthRemoteSource {
  factory AuthRemoteSource(Dio dio, {String? baseUrl}) = _AuthRemoteSource;

  @POST("login")
  Future<LoginResponse> logIn(@Body() LoginRequest body);

  @POST('register')
  Future<RegisterResponse> register(@Body() RegisterRequest body);
}
