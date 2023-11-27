import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'create_booking.g.dart';

@JsonSerializable()
class CreateBookingResponse extends BaseResponse<CreateBookingBody?> {
  CreateBookingResponse(
      {required super.errors, required super.message, required super.data});
  factory CreateBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateBookingResponseToJson(this);
}

/// create create booking body based on this json
/// {
//       title: string
//       name: string
//       country: string
//       email: string
//       phoneNumber: string : null,
//       bookingId: string
//       startDateTime: string,
//       endDateTime: string : null,
//       offeringPrice: string,
//       addOns: string,
//       totalPersons: string,
//       createdAt: string,
//       updatedAt: string,
//       bookingStatus: string,
//       note: string,

// }
@JsonSerializable()
class CreateBookingBody {
  CreateBookingBody({
    this.title,
    this.name,
    this.country,
    this.email,
    this.phoneNumber,
    this.bookingId,
    this.startDateTime,
    this.endDateTime,
    this.offeringPrice,
    this.addOns,
    this.totalPersons,
    this.createdAt,
    this.updatedAt,
    this.bookingStatus,
    this.note,
  });
  factory CreateBookingBody.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingBodyFromJson(json);
  Map<String, dynamic> toJson() => _$CreateBookingBodyToJson(this);

  final String? title;
  final String? name;
  final String? country;
  final String? email;
  final String? phoneNumber;
  final String? bookingId;
  final String? startDateTime;
  final String? endDateTime;
  final String? offeringPrice;
  final String? addOns;
  final String? totalPersons;
  final String? createdAt;
  final String? updatedAt;
  final String? bookingStatus;
  final String? note;
}
