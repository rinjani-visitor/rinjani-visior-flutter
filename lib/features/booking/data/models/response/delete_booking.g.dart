// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteBookingResponse _$DeleteBookingResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteBookingResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$DeleteBookingResponseToJson(
        DeleteBookingResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };
