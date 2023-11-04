// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      packageId: json['packageId'] as String?,
      person: json['person'] as int?,
      proofOfPayment: json['proofOfPayment'] as String?,
      date: json['date'] as String,
      time: (json['time'] as List<dynamic>).map((e) => e as String).toSet(),
      addOn: (json['addOn'] as List<dynamic>)
          .map((e) => AddOnModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'person': instance.person,
      'proofOfPayment': instance.proofOfPayment,
      'date': instance.date,
      'time': instance.time.toList(),
      'addOn': instance.addOn.toList(),
    };
