import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'get_booking.g.dart';

@JsonSerializable()
class GetBookingResponse extends BaseResponse<List<GetBookingBody>?> {
  GetBookingResponse(
      {required super.errors, required super.message, required super.data});

  factory GetBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBookingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBookingResponseToJson(this);
}

@JsonSerializable()
class GetBookingBody {
  GetBookingBody({required this.id});

  final String id;
  factory GetBookingBody.fromJson(Map<String, dynamic> json) =>
      _$GetBookingBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetBookingBodyToJson(this);
}
