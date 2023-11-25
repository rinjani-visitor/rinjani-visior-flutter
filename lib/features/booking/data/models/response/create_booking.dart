import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'create_booking.g.dart';

@JsonSerializable()
class CreateBookingResponse extends BaseResponse<String?> {
  CreateBookingResponse(
      {required super.errors, required super.message, required super.data});
  factory CreateBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateBookingResponseToJson(this);
}
