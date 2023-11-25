import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'booking.g.dart';

@JsonSerializable()
class BookingResponse extends BaseResponse<String?> {
  BookingResponse(
      {required super.errors, required super.message, required super.data});

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookingResponseToJson(this);
}
