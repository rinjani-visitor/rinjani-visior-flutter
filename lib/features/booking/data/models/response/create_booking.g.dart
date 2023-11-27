// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBookingResponse _$CreateBookingResponseFromJson(
        Map<String, dynamic> json) =>
    CreateBookingResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CreateBookingBody.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateBookingResponseToJson(
        CreateBookingResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

CreateBookingBody _$CreateBookingBodyFromJson(Map<String, dynamic> json) =>
    CreateBookingBody(
      title: json['title'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      bookingId: json['bookingId'] as String?,
      startDateTime: json['startDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      offeringPrice: json['offeringPrice'] as String?,
      addOns: json['addOns'] as String?,
      totalPersons: json['totalPersons'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      bookingStatus: json['bookingStatus'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$CreateBookingBodyToJson(CreateBookingBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'name': instance.name,
      'country': instance.country,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'bookingId': instance.bookingId,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'offeringPrice': instance.offeringPrice,
      'addOns': instance.addOns,
      'totalPersons': instance.totalPersons,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'bookingStatus': instance.bookingStatus,
      'note': instance.note,
    };
