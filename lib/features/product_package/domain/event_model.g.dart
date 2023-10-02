// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventModel _$$_EventModelFromJson(Map<String, dynamic> json) =>
    _$_EventModel(
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
      dateTime: json['dateTime'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_EventModelToJson(_$_EventModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imgUrl': instance.imgUrl,
      'dateTime': instance.dateTime,
      'description': instance.description,
    };
