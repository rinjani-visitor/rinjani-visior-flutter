// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booking_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookingDetailResponse _$GetBookingDetailResponseFromJson(
        Map<String, dynamic> json) =>
    GetBookingDetailResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : GetBookingDetailBody.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetBookingDetailResponseToJson(
        GetBookingDetailResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

GetBookingDetailBody _$GetBookingDetailBodyFromJson(
        Map<String, dynamic> json) =>
    GetBookingDetailBody(
      productId: json['productId'] as String,
      userId: json['userId'] as String,
      bookingId: json['bookingId'] as String,
      startDateTime: json['startDateTime'] as String,
      offeringPrice: json['offeringPrice'] as int,
      addOns: json['addOns'] as String,
      totalPersons: json['totalPersons'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      bookingStatus: json['bookingStatus'] as String,
      adminMessage: json['adminMessage'] as String,
      note: json['note'] as String,
      title: json['title'] as String,
      rating: json['rating'] as int,
      location: json['location'] as String,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$GetBookingDetailBodyToJson(
        GetBookingDetailBody instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'userId': instance.userId,
      'bookingId': instance.bookingId,
      'startDateTime': instance.startDateTime,
      'offeringPrice': instance.offeringPrice,
      'addOns': instance.addOns,
      'totalPersons': instance.totalPersons,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'bookingStatus': instance.bookingStatus,
      'adminMessage': instance.adminMessage,
      'note': instance.note,
      'title': instance.title,
      'rating': instance.rating,
      'location': instance.location,
      'thumbnail': instance.thumbnail,
    };
