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

@JsonSerializable(includeIfNull: false)
class OrderResponseBody {
  final String? orderId;
  final String? orderApproveDate;
  final String? title;
  final int? rating;
  final String? location;
  final String? status;
  final String? messageReview;
  final String? reviewCreatedAt;

  OrderResponseBody({
    required this.orderId,
    required this.orderApproveDate,
    required this.title,
    this.rating,
    this.messageReview,
    this.reviewCreatedAt,
    required this.location,
    required this.status,
  });

  factory OrderResponseBody.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseBodyToJson(this);

  OrderEntity toEntity() {
    return OrderEntity(
      id: orderId ?? "",
      title: title ?? "",
      rating: rating,
      messageReview: messageReview,
      reviewCreatedAt: reviewCreatedAt != null
          ? DateTime.parse(
              "${reviewCreatedAt}Z",
            ).toLocal()
          : null,
      status: status ?? "",
      location: location,
      approvedAt: DateTime.parse(
        "${orderApproveDate}Z",
      ).toLocal(),
    );
  }
}
