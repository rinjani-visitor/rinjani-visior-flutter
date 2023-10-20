// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      packageId: json['packageId'] as String?,
      person: json['person'] as int?,
      date: json['date'] as String,
      time: (json['time'] as List<dynamic>).map((e) => e as String).toSet(),
      addOnId:
          (json['addOnId'] as List<dynamic>).map((e) => e as String).toSet(),
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'person': instance.person,
      'date': instance.date,
      'time': instance.time.toList(),
      'addOnId': instance.addOnId.toList(),
    };
