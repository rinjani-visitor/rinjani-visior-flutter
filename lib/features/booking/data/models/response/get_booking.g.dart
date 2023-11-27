// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookingResponse _$GetBookingResponseFromJson(Map<String, dynamic> json) =>
    GetBookingResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetBookingBody.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBookingResponseToJson(GetBookingResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

GetBookingBody _$GetBookingBodyFromJson(Map<String, dynamic> json) =>
    GetBookingBody(
      id: json['id'] as String,
    );

Map<String, dynamic> _$GetBookingBodyToJson(GetBookingBody instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
