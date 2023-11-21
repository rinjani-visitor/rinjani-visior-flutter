// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResponse _$BasicResponseFromJson(Map<String, dynamic> json) =>
    BasicResponse(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$BasicResponseToJson(BasicResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
