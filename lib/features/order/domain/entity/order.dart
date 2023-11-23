import 'package:rinjani_visitor/features/product/domain/entity/addon.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

class OrderEntity {
  OrderEntity({
    required this.date,
    required this.time,
    required this.addOn,
    required this.person,
    this.packageId,
    this.product,
    this.proofOfPayment,
  });

  int get _addOnPricing {
    if (addOn.isEmpty) return 0;
    return addOn.map((e) => e.price).reduce((a, b) => a + b);
  }

  int get totalPrice => (product?.priceLow ?? 1 * person) + _addOnPricing;

  String? packageId;
  ProductDetailEntity? product;
  int person;
  String? proofOfPayment;
  String date;
  Set<String> time;
  Set<AddOnEntity> addOn;
}
