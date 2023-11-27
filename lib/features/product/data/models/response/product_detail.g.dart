// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailResponse _$ProductDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: ProductDetailBody.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailResponseToJson(
        ProductDetailResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

ProductDetailBody _$ProductDetailBodyFromJson(Map<String, dynamic> json) =>
    ProductDetailBody(
      productId: json['productId'] as String,
      title: json['title'] as String?,
      status: json['status'] as bool?,
      includeEndDateTime: json['includeEndDateTime'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      location: json['location'] as String?,
      lowestPrice: json['lowestPrice'] as int?,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
      duration: json['duration'] as String?,
      program: json['program'] as String?,
      category: json['category'] as String?,
      subCategory: json['subCategory'] as String?,
      favoritedCount: json['favoritedCount'] as int?,
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      note: json['note'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      userFavorited: json['userFavorited'] as bool?,
      fotos: (json['fotos'] as List<dynamic>?)
          ?.map((e) => Fotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews:
          (json['reviews'] as List<dynamic>?)?.map((e) => e as String).toList(),
    )..addOns =
        (json['addOns'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ProductDetailBodyToJson(ProductDetailBody instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'userFavorited': instance.userFavorited,
      'includeEndDateTime': instance.includeEndDateTime,
      'title': instance.title,
      'status': instance.status,
      'rating': instance.rating,
      'location': instance.location,
      'lowestPrice': instance.lowestPrice,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'duration': instance.duration,
      'program': instance.program,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'favoritedCount': instance.favoritedCount,
      'facilities': instance.facilities,
      'addOns': instance.addOns,
      'note': instance.note,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'fotos': instance.fotos,
      'reviews': instance.reviews,
    };

Fotos _$FotosFromJson(Map<String, dynamic> json) => Fotos(
      fotoId: json['fotoId'] as int?,
      url: json['url'] as String?,
      originalName: json['originalName'] as String?,
      productId: json['productId'] as String?,
    );

Map<String, dynamic> _$FotosToJson(Fotos instance) => <String, dynamic>{
      'fotoId': instance.fotoId,
      'url': instance.url,
      'originalName': instance.originalName,
      'productId': instance.productId,
    };
