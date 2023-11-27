// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePaymentResponse _$UpdatePaymentResponseFromJson(
        Map<String, dynamic> json) =>
    UpdatePaymentResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UpdatePaymentResponseToJson(
        UpdatePaymentResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
    };
