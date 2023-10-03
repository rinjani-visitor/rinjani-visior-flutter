// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      title: json['title'] as String,
      description: json['description'] as String,
      orderBookingNo: json['orderBookingNo'] as String,
      orderDate: json['orderDate'] as String,
      status: $enumDecodeNullable(_$NotificationStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'orderBookingNo': instance.orderBookingNo,
      'orderDate': instance.orderDate,
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
