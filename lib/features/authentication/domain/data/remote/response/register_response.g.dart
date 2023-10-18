// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      json['error'] as bool,
      json['message'] as String,
      json['user'] == null
          ? null
          : RegisterResponseBody.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'user': instance.user,
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
