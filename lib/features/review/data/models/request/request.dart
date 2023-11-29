import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class PostReviewRequest {
  final String orderId;
  final String messageReview;
  final String rating;

  PostReviewRequest({
    required this.orderId,
    required this.messageReview,
    required this.rating,
  });
}
