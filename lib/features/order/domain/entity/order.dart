import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

class OrderEntity {
  final String id;
  final String title;
  final int rating;
  final String status;
  final DateTime approvedAt;
  final String? location;

  OrderEntity({
    this.location,
    required this.id,
    required this.title,
    required this.rating,
    required this.status,
    required this.approvedAt,
  });
}
