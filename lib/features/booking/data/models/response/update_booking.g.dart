// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBookingResponse _$UpdateBookingResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateBookingResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$UpdateBookingResponseToJson(
        UpdateBookingResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };
