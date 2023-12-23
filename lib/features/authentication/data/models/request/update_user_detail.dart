import 'package:json_annotation/json_annotation.dart';

part 'update_user_detail.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateUserDetailRequest {
  String? name;
  String? email;
  String? country;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
  String? profilPicture;

  UpdateUserDetailRequest({
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
    this.country,
    this.profilPicture,
  });
  factory UpdateUserDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDetailRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserDetailRequestToJson(this);
}
