import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rinjani_visitor/features/product/domain/addon_model.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';

part 'order_model.g.dart';
part 'order_model.freezed.dart';

@unfreezed
class OrderModel with _$OrderModel {
  int get totalPrice =>
      (product!.priceLow * person) +
      addOn.map((e) => e.price).reduce((a, b) => a + b);
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
