// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) =>
    BookingRequest(
      userId: json['userId'] as String,
      productId: json['productId'] as String,
      startDateTime: json['startDateTime'] as String,
      endDateTime: json['endDateTime'] as String,
      addOns:
          (json['addOns'] as List<dynamic>).map((e) => e as String).toList(),
      offeringPrice: json['offeringPrice'] as String,
      totalPersons: json['totalPersons'] as String,
    );

Map<String, dynamic> _$BookingRequestToJson(BookingRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'productId': instance.productId,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'addOns': instance.addOns,
      'offeringPrice': instance.offeringPrice,
      'totalPersons': instance.totalPersons,
    };
