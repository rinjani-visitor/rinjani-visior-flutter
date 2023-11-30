import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/order/domain/entity/order.dart';

part 'get_order.g.dart';

@JsonSerializable()
class OrderResponse extends BaseResponse<List<OrderResponseBody>?> {
  OrderResponse(
      {required super.errors, required super.message, required super.data});

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class OrderResponseBody {
  final String? orderId;
  final String? orderApproveDate;
  final String? title;
  final int? rating;
  final String? location;
  final String? status;

  OrderResponseBody(
      {required this.orderId,
      required this.orderApproveDate,
      required this.title,
      required this.rating,
      required this.location,
      required this.status});

  factory OrderResponseBody.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseBodyToJson(this);

  OrderEntity toEntity() {
    return OrderEntity(
        id: orderId ?? "",
        title: title ?? "",
        rating: rating ?? 0,
        status: status ?? "",
        location: location,
        approvedAt: DateTime.parse(
          orderApproveDate ?? "",
        ));
  }
}
