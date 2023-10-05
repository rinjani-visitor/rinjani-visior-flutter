import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/comment_review/domain/comment_model.dart';

abstract class ReviewRepository {
  Future<void> createReview({CommentModel newReview});
  Future<LocalState<CommentModel>> getReview({String reviewId});
  Future<LocalState<CommentModel>> deleteReview({String reviewId});
  Future<LocalState<CommentModel>> editReview(CommentModel modifiedReview);
}
