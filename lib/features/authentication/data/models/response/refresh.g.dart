// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshResponse _$RefreshResponseFromJson(Map<String, dynamic> json) =>
    RefreshResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : RefreshResponseBody.fromJson(json['data'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$RefreshResponseToJson(RefreshResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

RefreshResponseBody _$RefreshResponseBodyFromJson(Map<String, dynamic> json) =>
    RefreshResponseBody(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$RefreshResponseBodyToJson(
        RefreshResponseBody instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
    };
