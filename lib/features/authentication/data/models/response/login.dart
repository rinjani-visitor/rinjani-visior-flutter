import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse<LoginResponseBody?> {
  String? accessToken;
  String? refreshToken;

  LoginResponse(
      {required super.errors,
      required super.message,
      required super.data,
      this.accessToken,
      this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  AuthEntity toEntity() => AuthEntity(
      username: data?.name,
      userId: data?.userId,
      email: data?.email,
      accessToken: accessToken,
      refreshToken: refreshToken);
}

@JsonSerializable()
class LoginResponseBody {
  final String? userId;
  final String? name;
  final String? email;
  final String? password;
  final String? role;

  LoginResponseBody(
      {this.userId, this.email, this.name, this.role, this.password});

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}
