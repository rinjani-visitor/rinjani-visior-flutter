import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rinjani_visitor/features/product/domain/addon_model.dart';

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
    required Set<AddOnModel> addOn,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}
