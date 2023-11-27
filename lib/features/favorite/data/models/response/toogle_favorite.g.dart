// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toogle_favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleFavoriteResponse _$ToggleFavoriteResponseFromJson(
        Map<String, dynamic> json) =>
    ToggleFavoriteResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ToggleFavoriteBody.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToggleFavoriteResponseToJson(
        ToggleFavoriteResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

ToggleFavoriteBody _$ToggleFavoriteBodyFromJson(Map<String, dynamic> json) =>
    ToggleFavoriteBody(
      favoriteId: json['favoriteId'] as int?,
      productId: json['productId'] as String?,
    );

Map<String, dynamic> _$ToggleFavoriteBodyToJson(ToggleFavoriteBody instance) =>
    <String, dynamic>{
      'favoriteId': instance.favoriteId,
      'productId': instance.productId,
    };
