import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';

import 'package:rinjani_visitor/features/authentication/data/models/request/login_request.dart';
import 'package:rinjani_visitor/features/authentication/data/models/request/register_request.dart';
import 'package:rinjani_visitor/features/authentication/data/models/response/response.dart';

part 'remote.g.dart';

@RestApi(baseUrl: restApiBaseUrl)
abstract class AuthRemoteSource {
  factory AuthRemoteSource(Dio dio, {String? baseUrl}) = _AuthRemoteSource;

  @POST("/api/users/login")
  Future<LoginResponse> logIn(@Body() LoginRequest body);

  @POST('/api/users')
  Future<RegisterResponse> register(@Body() RegisterRequest body);

  @GET('/api/users/refresh')
  Future<RefreshResponse> refresh(@Header("Authorization") String refreshToken);
}
