import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/comment_review/domain/entity/review.dart';

class WriteReviewViewModel extends StateNotifier<ReviewEntity> {
  WriteReviewViewModel() : super(ReviewEntity());
  void sendReview() {}
}
