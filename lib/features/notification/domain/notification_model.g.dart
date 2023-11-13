// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      orderBookingNo: json['orderBookingNo'] as String,
      orderDate: json['orderDate'] as String,
      viewed: json['viewed'] as bool,
      status: $enumDecodeNullable(_$NotificationStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'orderBookingNo': instance.orderBookingNo,
      'orderDate': instance.orderDate,
      'viewed': instance.viewed,
      'status': _$NotificationStatusEnumMap[instance.status],
    };

const _$NotificationStatusEnumMap = {
  NotificationStatus.error: 'error',
  NotificationStatus.offering: 'offering',
  NotificationStatus.success: 'success',
  NotificationStatus.waiting: 'waiting',
  NotificationStatus.review: 'review',
  NotificationStatus.available: 'available',
};
