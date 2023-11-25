import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable()
class BookingRequest {
  final String userId;
  final String productId;
  final String startDateTime;
  final String endDateTime;
  final List<String> addOns;
  final String offeringPrice;
  final String totalPersons;

  BookingRequest(
      {required this.userId,
      required this.productId,
      required this.startDateTime,
      required this.endDateTime,
      required this.addOns,
      required this.offeringPrice,
      required this.totalPersons});

  factory BookingRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BookingRequestToJson(this);
}
