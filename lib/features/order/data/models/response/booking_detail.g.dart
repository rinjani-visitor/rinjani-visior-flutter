// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDetailResponse _$BookingDetailResponseFromJson(
        Map<String, dynamic> json) =>
    BookingDetailResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$BookingDetailResponseToJson(
        BookingDetailResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };
