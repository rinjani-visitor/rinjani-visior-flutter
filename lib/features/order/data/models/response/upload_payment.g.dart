// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPaymentResponse _$UploadPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    UploadPaymentResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$UploadPaymentResponseToJson(
        UploadPaymentResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };
