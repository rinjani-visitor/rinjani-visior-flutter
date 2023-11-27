import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'update_booking.g.dart';

@JsonSerializable()
class UpdateBookingResponse extends BaseResponse<String?> {
  UpdateBookingResponse(
      {required super.errors, required super.message, required super.data});
  factory UpdateBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateBookingResponseToJson(this);
}
