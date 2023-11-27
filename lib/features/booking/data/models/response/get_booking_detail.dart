import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'get_booking_detail.g.dart';

@JsonSerializable()
class GetBookingDetailResponse extends BaseResponse<String?> {
  GetBookingDetailResponse(
      {required super.errors, required super.message, required super.data});
  factory GetBookingDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBookingDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBookingDetailResponseToJson(this);
}

@JsonSerializable()
class GetBookingDetailBody {
  final String id;

  GetBookingDetailBody({required this.id});
  factory GetBookingDetailBody.fromJson(Map<String, dynamic> json) =>
      _$GetBookingDetailBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetBookingDetailBodyToJson(this);
}
