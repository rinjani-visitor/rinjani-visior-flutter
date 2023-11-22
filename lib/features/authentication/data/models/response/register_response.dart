import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final bool error;
  final String message;
  final RegisterResponseBody? user;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  RegisterResponse(this.error, this.message, this.user);

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
