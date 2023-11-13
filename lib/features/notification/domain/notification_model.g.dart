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
      status: $enumDecodeNullable(_$StatusColorEnumMap, json['status']),
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
      'status': _$StatusColorEnumMap[instance.status],
    };

const _$StatusColorEnumMap = {
  StatusColor.error: 'error',
  StatusColor.success: 'success',
  StatusColor.waiting: 'waiting',
  StatusColor.review: 'review',
  StatusColor.available: 'available',
  StatusColor.init: 'init',
};
