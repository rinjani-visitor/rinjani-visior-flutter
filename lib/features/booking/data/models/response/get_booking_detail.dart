import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/enum/history_status.dart';

part 'get_booking_detail.g.dart';

@JsonSerializable()
class GetBookingDetailResponse extends BaseResponse<GetBookingDetailBody?> {
  GetBookingDetailResponse(
      {required super.errors, required super.message, required super.data});
  factory GetBookingDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBookingDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBookingDetailResponseToJson(this);
  BookingDetailEntity toEntity() {
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
      adminMessage: data!.adminMessage,
      note: data!.note,
      title: data!.title,
      rating: data!.rating,
      location: data!.location,
      thumbnail: data!.thumbnail,
    );
  }
}

@JsonSerializable()
class GetBookingDetailBody {
  GetBookingDetailBody({
    required this.productId,
    required this.userId,
    required this.bookingId,
    required this.startDateTime,
    required this.offeringPrice,
    required this.addOns,
    required this.totalPersons,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingStatus,
    required this.adminMessage,
    required this.note,
    required this.title,
    required this.rating,
    required this.location,
    required this.thumbnail,
  });
  factory GetBookingDetailBody.fromJson(Map<String, dynamic> json) =>
      _$GetBookingDetailBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetBookingDetailBodyToJson(this);

  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "userId")
  final String userId;
  @JsonKey(name: "bookingId")
  final String bookingId;
  @JsonKey(name: "startDateTime")
  final String startDateTime;
  @JsonKey(name: "offeringPrice")
  final int offeringPrice;
  @JsonKey(name: "addOns")
  final String addOns;
  @JsonKey(name: "totalPersons")
  final int totalPersons;
  @JsonKey(name: "createdAt")
  final String createdAt;
  @JsonKey(name: "updatedAt")
  final String updatedAt;
  @JsonKey(name: "bookingStatus")
  final String bookingStatus;
  @JsonKey(name: "adminMessage")
  final String adminMessage;
  @JsonKey(name: "note")
  final String note;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "rating")
  final double rating;
  @JsonKey(name: "location")
  final String location;
  @JsonKey(name: "thumbnail")
  final String thumbnail;
}
