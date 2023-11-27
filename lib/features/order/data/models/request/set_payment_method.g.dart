// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPaymentMethod _$SetPaymentMethodFromJson(Map<String, dynamic> json) =>
    SetPaymentMethod(
      bookingId: json['bookingId'] as String,
      method: json['method'] as String,
    );

Map<String, dynamic> _$SetPaymentMethodToJson(SetPaymentMethod instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'method': instance.method,
    };
