// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostBookingRequest _$PostBookingRequestFromJson(Map<String, dynamic> json) =>
    PostBookingRequest(
      userId: json['userId'] as String,
      productId: json['productId'] as String,
      startDateTime: json['startDateTime'] as String,
      addOns: json['addOns'] as String,
      offeringPrice: json['offeringPrice'] as String,
      totalPersons: json['totalPersons'] as String,
    );

Map<String, dynamic> _$PostBookingRequestToJson(PostBookingRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'productId': instance.productId,
      'startDateTime': instance.startDateTime,
      'addOns': instance.addOns,
      'offeringPrice': instance.offeringPrice,
      'totalPersons': instance.totalPersons,
    };
