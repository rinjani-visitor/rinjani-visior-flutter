// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      paymentName: json['paymentName'] as String,
      paymentImgUrl: json['paymentImgUrl'] as String,
      paymentId: json['paymentId'] as String,
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'paymentName': instance.paymentName,
      'paymentImgUrl': instance.paymentImgUrl,
      'paymentId': instance.paymentId,
    };
