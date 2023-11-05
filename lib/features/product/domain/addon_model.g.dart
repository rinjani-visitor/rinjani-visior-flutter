// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddOnModelImpl _$$AddOnModelImplFromJson(Map<String, dynamic> json) =>
    _$AddOnModelImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      price: json['price'] as int,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$AddOnModelImplToJson(_$AddOnModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'id': instance.id,
    };
