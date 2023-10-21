import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.g.dart';
part 'order_model.freezed.dart';

@unfreezed
class OrderModel with _$OrderModel {
  factory OrderModel({
    String? packageId,
    int? person,
    String? proofOfPayment,
    required String date,
    required Set<String> time,
    required Set<String> addOnId,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}
