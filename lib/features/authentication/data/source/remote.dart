import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';

import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/login_request.dart';
import 'package:rinjani_visitor/features/authentication/domain/data/remote/register_request.dart';

part 'remote.g.dart';

@RestApi(baseUrl: restApiBaseUrl)
abstract class AuthRemoteSource {
  factory AuthRemoteSource(Dio dio, {String? baseUrl}) = _AuthRemoteSource;

  @POST("/login")
  Future<AuthModel> logIn(@Body() LoginRequest body);

  @POST('/register')
  Future<AuthModel> register(@Body() RegisterRequest body);
}
