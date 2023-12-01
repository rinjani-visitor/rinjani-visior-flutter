import 'package:json_annotation/json_annotation.dart';

part 'update_user_detail.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateUserDetailRequest {
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? confirmPassword;

  UpdateUserDetailRequest({
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
  });
  factory UpdateUserDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDetailRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserDetailRequestToJson(this);
}
