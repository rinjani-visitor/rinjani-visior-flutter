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

  int get totalPrice => (product?.lowestPrice ?? 1 * person);

  String? packageId;
  ProductDetailEntity? product;
  int person;
  String? proofOfPayment;
  String date;
  Set<String> time;
  Set<String> addOn;
}
