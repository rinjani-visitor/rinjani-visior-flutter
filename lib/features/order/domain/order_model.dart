import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rinjani_visitor/features/product/domain/addon_model.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';

part 'order_model.g.dart';
part 'order_model.freezed.dart';

@unfreezed
class OrderModel with _$OrderModel {
  int get _addOnPricing {
    if (addOn.isEmpty) return 0;
    return addOn.map((e) => e.price).reduce((a, b) => a + b);
  }

  int get totalPrice => (product?.priceLow ?? 1 * person) + _addOnPricing;
  const OrderModel._();
  factory OrderModel({
    String? packageId,
    ProductModel? product,
    @Default(0) int person,
    String? proofOfPayment,
    required String date,
    required Set<String> time,
    required Set<AddOnModel> addOn,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}
