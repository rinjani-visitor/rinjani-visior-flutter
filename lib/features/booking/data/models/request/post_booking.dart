import 'package:json_annotation/json_annotation.dart';

part 'post_booking.g.dart';

@JsonSerializable(includeIfNull: false)
class PostBookingRequest {
  @JsonKey(name: 'productId')
  final String productId;
  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'startDateTime')
  final String startDateTime;
  @JsonKey(name: 'endDateTime')
  final String? endDateTime;
  @JsonKey(name: 'addOns')
  final String addOns;
  @JsonKey(name: 'offeringPrice')
  final String offeringPrice;
  @JsonKey(name: 'totalPersons')
  final String totalPersons;

  PostBookingRequest({
    required this.productId,
    required this.userId,
    required this.startDateTime,
    this.endDateTime,
    required this.addOns,
    required this.offeringPrice,
    required this.totalPersons,
  });

  factory PostBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$PostBookingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostBookingRequestToJson(this);
}
