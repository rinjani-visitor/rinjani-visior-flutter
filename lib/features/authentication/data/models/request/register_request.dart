import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String? email;
  final String? username;
  final String? password;
  final String? confirmPassword;
  final String? phone;
  final String? country;

  const RegisterRequest(
      {this.email,
      this.username,
      this.password,
      this.phone,
      this.country,
      this.confirmPassword});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
