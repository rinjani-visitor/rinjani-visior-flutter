class OrderEntity {
  final String id;
  final String title;
  final int? rating;
  final String status;
  final DateTime approvedAt;
  final String? location;
  final String? messageReview;
  final DateTime? reviewCreatedAt;

  OrderEntity({
    this.location,
    required this.id,
    required this.title,
    required this.status,
    required this.approvedAt,
    this.rating,
    this.messageReview,
    this.reviewCreatedAt,
  });
}
