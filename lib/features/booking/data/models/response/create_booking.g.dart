// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBookingResponse _$CreateBookingResponseFromJson(
        Map<String, dynamic> json) =>
    CreateBookingResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$CreateBookingResponseToJson(
        CreateBookingResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };
