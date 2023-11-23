// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : RegisterResponseBody.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

RegisterResponseBody _$RegisterResponseBodyFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseBody(
      json['userId'] as String?,
      json['username'] as String?,
      json['country'] as String?,
      json['email'] as String?,
      json['password'] as String?,
    );

Map<String, dynamic> _$RegisterResponseBodyToJson(
        RegisterResponseBody instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'country': instance.country,
      'email': instance.email,
      'password': instance.password,
    };
