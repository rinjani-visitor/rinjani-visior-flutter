import 'package:rinjani_visitor/features/comment_review/domain/entity/review.dart';

abstract class ReviewRepository {
  Future<void> createReview(ReviewEntity entity);
  Future<ReviewEntity> getReview(String reviewId);
  Future<ReviewEntity> getReviews(String packageId);
  Future<ReviewEntity> deleteReview(String reviewId);
  Future<void> changeReview(ReviewEntity modifiedReview);
}
