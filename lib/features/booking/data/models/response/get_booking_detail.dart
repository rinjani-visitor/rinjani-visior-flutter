import "dart:developer" as developer;
import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/enum/history_status.dart';

part 'get_booking_detail.g.dart';

@JsonSerializable()
class GetBookingDetailResponse extends BaseResponse<BookingData?> {
  GetBookingDetailResponse(
      {required super.errors, required super.message, required super.data});
  factory GetBookingDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBookingDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBookingDetailResponseToJson(this);
  BookingDetailEntity toEntity() {
    developer.log("to entity ${data?.bookingId}",
        name: "GetBookingDetailResponse");
    return BookingDetailEntity(
      productId: data!.productId,
      userId: data!.userId,
      bookingId: data!.bookingId,
      startDateTime: DateTime.parse(data!.startDateTime).toLocal(),
      offeringPrice: data!.offeringPrice,
      addOns: data!.addOns,
      totalPersons: data!.totalPersons,
      createdAt: DateTime.parse(data!.createdAt).toLocal(),
      updatedAt: DateTime.parse(data!.updatedAt).toLocal(),
      bookingStatus: BookingStatus.fromString(data!.bookingStatus),
      adminMessage: data?.adminMessage,
      note: data!.note,
      title: data!.title,
      rating: data!.rating,
      location: data!.location,
      thumbnail: data!.thumbnail,
    );
  }
}

@JsonSerializable()
class BookingData {
  final String productId;
  final String userId;
  final String bookingId;
  final String startDateTime;
  final int offeringPrice;
  final String addOns;
  final int totalPersons;
  final String createdAt;
  final String updatedAt;
  final String bookingStatus;
  final String note;
  final String? adminMessage;
  final String title;
  final double rating;
  final String location;
  final String thumbnail;

  BookingData(
      {required this.productId,
      required this.userId,
      required this.bookingId,
      required this.startDateTime,
      required this.offeringPrice,
      required this.addOns,
      required this.totalPersons,
      required this.createdAt,
      required this.updatedAt,
      required this.bookingStatus,
      required this.note,
      required this.title,
      required this.rating,
      required this.location,
      required this.thumbnail,
      this.adminMessage});

  factory BookingData.fromJson(Map<String, dynamic> json) =>
      _$BookingDataFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDataToJson(this);
}
