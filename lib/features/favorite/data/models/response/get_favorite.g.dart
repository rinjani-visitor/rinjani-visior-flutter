// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavoriteResponse _$GetFavoriteResponseFromJson(Map<String, dynamic> json) =>
    GetFavoriteResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetFavoriteBody.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFavoriteResponseToJson(
        GetFavoriteResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

GetFavoriteBody _$GetFavoriteBodyFromJson(Map<String, dynamic> json) =>
    GetFavoriteBody(
      productId: json['productId'] as String,
      title: json['title'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      avaiable: json['status'] as bool?,
      category: json['category'] as String?,
      location: json['location'] as String?,
      lowestPrice: json['lowestPrice'] as int?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$GetFavoriteBodyToJson(GetFavoriteBody instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'title': instance.title,
      'category': instance.category,
      'status': instance.avaiable,
      'rating': instance.rating,
      'location': instance.location,
      'thumbnail': instance.thumbnail,
      'lowestPrice': instance.lowestPrice,
    };
