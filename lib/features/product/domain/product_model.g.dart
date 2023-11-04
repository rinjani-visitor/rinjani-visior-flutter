// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageModelImpl _$$PackageModelImplFromJson(Map<String, dynamic> json) =>
    _$PackageModelImpl(
      packageId: json['packageId'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      imgUrl: json['imgUrl'] as String,
      category: $enumDecode(_$ProductCategoryEnumMap, json['category']),
      locationUrl: json['locationUrl'] as String?,
      avaiabilityStatus: json['avaiabilityStatus'] as String?,
      priceLow: json['priceLow'] as int,
      priceHigh: json['priceHigh'] as int,
      rating: json['rating'] as String,
      tripDuration: json['tripDuration'] as String,
      description: json['description'] as String,
      accomodation: json['accomodation'] as String,
      reviewCount: json['reviewCount'] as int,
      initenaryList: (json['initenaryList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      timeList24H: (json['timeList24H'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      addOn: (json['addOn'] as List<dynamic>)
          .map((e) => AddOnModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewIds: (json['reviewIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PackageModelImplToJson(_$PackageModelImpl instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'title': instance.title,
      'location': instance.location,
      'imgUrl': instance.imgUrl,
      'category': _$ProductCategoryEnumMap[instance.category]!,
      'locationUrl': instance.locationUrl,
      'avaiabilityStatus': instance.avaiabilityStatus,
      'priceLow': instance.priceLow,
      'priceHigh': instance.priceHigh,
      'rating': instance.rating,
      'tripDuration': instance.tripDuration,
      'description': instance.description,
      'accomodation': instance.accomodation,
      'reviewCount': instance.reviewCount,
      'initenaryList': instance.initenaryList,
      'timeList24H': instance.timeList24H,
      'addOn': instance.addOn,
      'reviewIds': instance.reviewIds,
    };

const _$ProductCategoryEnumMap = {
  ProductCategory.rinjani: 'rinjani',
  ProductCategory.homeStay: 'homeStay',
  ProductCategory.culture: 'culture',
  ProductCategory.landscape: 'landscape',
};
