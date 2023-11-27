// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booking_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookingDetailResponse _$GetBookingDetailResponseFromJson(
        Map<String, dynamic> json) =>
    GetBookingDetailResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$GetBookingDetailResponseToJson(
        GetBookingDetailResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

GetBookingDetailBody _$GetBookingDetailBodyFromJson(
        Map<String, dynamic> json) =>
    GetBookingDetailBody(
      id: json['id'] as String,
    );

Map<String, dynamic> _$GetBookingDetailBodyToJson(
        GetBookingDetailBody instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
