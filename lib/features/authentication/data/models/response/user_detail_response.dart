import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth_detail.dart';

part 'user_detail_response.g.dart';

@JsonSerializable()
class UserDetailResponse extends BaseResponse<UserDetailResponseBody?> {
  UserDetailResponse(
      {required super.errors, required super.message, required super.data});
  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailResponseToJson(this);

  AuthDetailEntity toEntity() => AuthDetailEntity(
      name: data?.name,
      email: data?.email,
      country: data?.country,
      phoneNumber: data?.phoneNumber,
      profileImg: data?.imgUrl);
}

@JsonSerializable()
class UserDetailResponseBody {
  final String name;
  final String email;
  final String country;
  final String phoneNumber;
  @JsonKey(name: "profilPicture")
  final String imgUrl;

  UserDetailResponseBody(
      {required this.name,
      required this.email,
      required this.country,
      required this.phoneNumber,
      required this.imgUrl});

  factory UserDetailResponseBody.fromJson(Map<String, dynamic> json) =>
      _$UserDetailResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailResponseBodyToJson(this);
}
