// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackageModel _$$_PackageModelFromJson(Map<String, dynamic> json) =>
    _$_PackageModel(
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
      location: json['location'] as String,
      locationUrl: json['locationUrl'] as String?,
      lowestPricing: json['lowestPricing'] as String,
      highestPricing: json['highestPricing'] as String,
      description: json['description'] as String,
      tripDuration: json['tripDuration'] as String,
      avaiabilityStatus: json['avaiabilityStatus'] as String?,
      rating: json['rating'] as String,
      reviewCount: json['reviewCount'] as int,
    );

Map<String, dynamic> _$$_PackageModelToJson(_$_PackageModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imgUrl': instance.imgUrl,
      'location': instance.location,
      'locationUrl': instance.locationUrl,
      'lowestPricing': instance.lowestPricing,
      'highestPricing': instance.highestPricing,
      'description': instance.description,
      'tripDuration': instance.tripDuration,
      'avaiabilityStatus': instance.avaiabilityStatus,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
    };
