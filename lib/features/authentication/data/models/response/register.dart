import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';

part 'register.g.dart';

@JsonSerializable()
class RegisterResponse extends BaseResponse<RegisterResponseBody?> {
  RegisterResponse(
      {required super.errors, required super.message, required super.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class RegisterResponseBody {
  final String? userId;
  final String? username;
  final String? country;
  final String? email;
  final String? password;

  RegisterResponseBody(
      this.userId, this.username, this.country, this.email, this.password);

  factory RegisterResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseBodyToJson(this);
  AuthEntity toEntity() => AuthEntity(
        userId: userId,
        email: email,
        username: username,
      );
}
