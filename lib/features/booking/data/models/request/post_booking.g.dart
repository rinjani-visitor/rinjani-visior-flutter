// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostBookingRequest _$PostBookingRequestFromJson(Map<String, dynamic> json) =>
    PostBookingRequest(
      productId: json['productId'] as String,
      userId: json['userId'] as String,
      startDateTime: json['startDateTime'] as String,
      endDateTime: json['endDateTime'] as String?,
      addOns: json['addOns'] as String,
      offeringPrice: json['offeringPrice'] as String,
      totalPersons: json['totalPersons'] as String,
    );

Map<String, dynamic> _$PostBookingRequestToJson(PostBookingRequest instance) {
  final val = <String, dynamic>{
    'productId': instance.productId,
    'userId': instance.userId,
    'startDateTime': instance.startDateTime,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endDateTime', instance.endDateTime);
  val['addOns'] = instance.addOns;
  val['offeringPrice'] = instance.offeringPrice;
  val['totalPersons'] = instance.totalPersons;
  return val;
}
