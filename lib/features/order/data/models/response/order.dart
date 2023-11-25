import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderResponse extends BaseResponse<String?> {
  OrderResponse(
      {required super.errors, required super.message, required super.data});

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
