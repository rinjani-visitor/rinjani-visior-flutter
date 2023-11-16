import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool error;
  final String message;
  final LoginResponseBody? loginResult;
  LoginResponse({required this.error, required this.message, this.loginResult});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginResponseBody {
  final String userId;
  final String username;
  final String email;
  final String token;

  LoginResponseBody(
      {required this.userId,
      required this.email,
      required this.username,
      required this.token});

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
  Auth toEntity() =>
      Auth(userId: userId, email: email, username: username, token: token);
}
