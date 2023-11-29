import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String? email;
  final String? name;
  final String? password;
  final String? confirmPassword;
  final String? phone;
  final String? country;

  const RegisterRequest(
      {this.email,
      this.name,
      this.password,
      this.phone,
      this.country,
      this.confirmPassword});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
