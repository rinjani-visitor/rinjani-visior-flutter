// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetResponse _$ResetResponseFromJson(Map<String, dynamic> json) =>
    ResetResponse(
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ResetResponseToJson(ResetResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
    };
