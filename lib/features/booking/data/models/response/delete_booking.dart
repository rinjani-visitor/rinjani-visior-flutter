import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'delete_booking.g.dart';

@JsonSerializable()
class DeleteBookingResponse {
  final List<String>? errors;
  final String? message;
  DeleteBookingResponse({required this.errors, required this.message});
  factory DeleteBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBookingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteBookingResponseToJson(this);
}
