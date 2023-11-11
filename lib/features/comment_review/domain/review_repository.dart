import 'package:rinjani_visitor/features/comment_review/domain/comment_model.dart';

abstract class ReviewRepository {
  Future<void> createReview({CommentModel newReview});
  Future<CommentModel> getReview({String reviewId});
  Future<CommentModel> deleteReview({String reviewId});
  Future<CommentModel> editReview(CommentModel modifiedReview);
}
