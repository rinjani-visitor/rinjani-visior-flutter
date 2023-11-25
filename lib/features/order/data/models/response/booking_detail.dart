import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'booking_detail.g.dart';

@JsonSerializable()
class BookingDetailResponse extends BaseResponse<String?> {
  BookingDetailResponse(
      {required super.errors, required super.message, required super.data});

  factory BookingDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDetailResponseToJson(this);
}
