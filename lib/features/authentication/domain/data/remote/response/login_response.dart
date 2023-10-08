import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String userId;
  final String username;
  final String email;
  final String token;
  LoginResponse(
      {required this.userId,
      required this.username,
      required this.email,
      required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
