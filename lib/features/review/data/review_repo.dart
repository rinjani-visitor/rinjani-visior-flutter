import 'package:rinjani_visitor/features/review/domain/entity/review.dart';
import 'package:rinjani_visitor/features/review/domain/repo/review.dart';

/// class ReviewRepositoryImpl that implements ReviewRepository abstract class
class ReviewRepositoryImpl implements ReviewRepository {
  @override
  Future<void> changeReview(ReviewEntity modifiedReview) {
    // TODO: implement changeReview
    throw UnimplementedError();
  }

  @override
  Future<void> createReview(ReviewEntity entity) {
    // TODO: implement createReview
    throw UnimplementedError();
  }

  @override
  Future<ReviewEntity> deleteReview(String reviewId) {
    // TODO: implement deleteReview
    throw UnimplementedError();
  }

  @override
  Future<ReviewEntity> getReview(String reviewId) {
    // TODO: implement getReview
    throw UnimplementedError();
  }

  @override
  Future<ReviewEntity> getReviews(String packageId) {
    // TODO: implement getReviews
    throw UnimplementedError();
  }
}
