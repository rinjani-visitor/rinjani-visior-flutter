// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingModel _$$_BookingModelFromJson(Map<String, dynamic> json) =>
    _$_BookingModel(
      packageList: (json['packageList'] as List<dynamic>)
          .map((e) => PackageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String,
      time: json['time'] as String,
      pricingOffer: json['pricingOffer'] as String,
      currencyUnit: json['currencyUnit'] as String,
      paymentProvider: json['paymentProvider'] as String?,
    );

Map<String, dynamic> _$$_BookingModelToJson(_$_BookingModel instance) =>
    <String, dynamic>{
      'packageList': instance.packageList,
      'date': instance.date,
      'time': instance.time,
      'pricingOffer': instance.pricingOffer,
      'currencyUnit': instance.currencyUnit,
      'paymentProvider': instance.paymentProvider,
    };
