import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/enum/history_status.dart';

part 'get_booking.g.dart';

@JsonSerializable()
class GetBookingResponse extends BaseResponse<List<GetBookingBody>?> {
  GetBookingResponse(
      {required super.errors, required super.message, required super.data});

  factory GetBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBookingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBookingResponseToJson(this);

  List<BookingEntity>? toEntity() {
    return data!.map((e) => e.toEntity()).toList();
  }
}

@JsonSerializable()
class GetBookingBody {
  @JsonKey(name: "bookingId")
  final String bookingId;
  @JsonKey(name: "bookingDate")
  final String bookingDate;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "bookingStatus")
  final String bookingStatus;
  @JsonKey(name: "bookingNote")
  final String? bookingNote;
  @JsonKey(name: "rating")
  final int? rating;
  @JsonKey(name: "location")
  final String? location;
  final String? thumbnail;
  GetBookingBody({
    required this.bookingId,
    required this.bookingDate,
    required this.title,
    required this.bookingStatus,
    this.bookingNote,
    this.rating,
    this.location,
    this.thumbnail,
  });
  factory GetBookingBody.fromJson(Map<String, dynamic> json) =>
      _$GetBookingBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetBookingBodyToJson(this);

  BookingEntity toEntity() {
    return BookingEntity(
      bookingId: bookingId,
      bookingDate: DateTime.parse(bookingDate),
      title: title,
      bookingStatus: BookingStatus.fromString(bookingStatus),
      bookingNote: bookingNote,
      rating: rating,
      location: location,
      imgUrl: thumbnail,
    );
  }
}
