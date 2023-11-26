// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDetailResponse _$GetUserDetailResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserDetailResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : UserDetailResponseBody.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserDetailResponseToJson(
        GetUserDetailResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

UserDetailResponseBody _$UserDetailResponseBodyFromJson(
        Map<String, dynamic> json) =>
    UserDetailResponseBody(
      name: json['name'] as String,
      email: json['email'] as String,
      country: json['country'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      imgUrl: json['profilPicture'] as String,
    );

Map<String, dynamic> _$UserDetailResponseBodyToJson(
        UserDetailResponseBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'country': instance.country,
      'phoneNumber': instance.phoneNumber,
      'profilPicture': instance.imgUrl,
    };
