// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductResponseBody.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

ProductResponseBody _$ProductResponseBodyFromJson(Map<String, dynamic> json) =>
    ProductResponseBody(
      productId: json['productId'] as String,
      title: json['title'] as String,
      avaiable: json['status'] as bool,
      rating: (json['rating'] as num).toDouble(),
      location: json['location'] as String,
      thumbnail: json['thumbnail'] as String,
      category: json['category'] as String,
      lowestPrice: json['lowestPrice'] as int,
    );

Map<String, dynamic> _$ProductResponseBodyToJson(
        ProductResponseBody instance) =>
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
