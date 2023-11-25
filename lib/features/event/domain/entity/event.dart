import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

class EventEntity {
  final String name;
  final String imgUrl;
  final DateTime date;
  final String description;
  final List<ProductDetailEntity> products;

  EventEntity(
      {required this.name,
      required this.imgUrl,
      required this.date,
      required this.description,
      required this.products});
}
