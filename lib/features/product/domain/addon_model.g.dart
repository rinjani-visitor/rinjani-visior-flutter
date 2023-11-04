// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddOnModelImpl _$$AddOnModelImplFromJson(Map<String, dynamic> json) =>
    _$AddOnModelImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      pricing: json['pricing'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$AddOnModelImplToJson(_$AddOnModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'pricing': instance.pricing,
      'id': instance.id,
    };
