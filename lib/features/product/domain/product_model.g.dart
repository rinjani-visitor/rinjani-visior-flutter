// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackageModel _$$_PackageModelFromJson(Map<String, dynamic> json) =>
    _$_PackageModel(
      packageId: json['packageId'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      locationUrl: json['locationUrl'] as String?,
      imgUrl: json['imgUrl'] as String,
      rangePricing: json['rangePricing'] as String,
      rating: json['rating'] as String,
      tripDuration: json['tripDuration'] as String,
      description: json['description'] as String,
      accomodation: json['accomodation'] as String,
      addOnIds: (json['addOnIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reviewIds: (json['reviewIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      initenaryList: (json['initenaryList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      timeList24H: (json['timeList24H'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      avaiabilityStatus: json['avaiabilityStatus'] as String?,
      reviewCount: json['reviewCount'] as int,
    );

Map<String, dynamic> _$$_PackageModelToJson(_$_PackageModel instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'title': instance.title,
      'location': instance.location,
      'locationUrl': instance.locationUrl,
      'imgUrl': instance.imgUrl,
      'rangePricing': instance.rangePricing,
      'rating': instance.rating,
      'tripDuration': instance.tripDuration,
      'description': instance.description,
      'accomodation': instance.accomodation,
      'addOnIds': instance.addOnIds,
      'reviewIds': instance.reviewIds,
      'initenaryList': instance.initenaryList,
      'timeList24H': instance.timeList24H,
      'avaiabilityStatus': instance.avaiabilityStatus,
      'reviewCount': instance.reviewCount,
    };
