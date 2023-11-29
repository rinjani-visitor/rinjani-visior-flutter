import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/review/domain/entity/review.dart';
import 'package:rinjani_visitor/features/review/domain/entity/review_form.dart';

final writeReviewViewModelProvider =
    NotifierProvider<WriteReviewViewModel, ReviewForm>(
        WriteReviewViewModel.new);

class WriteReviewViewModel extends Notifier<ReviewForm> {
  @override
  ReviewForm build() {
    return ReviewForm(
      orderId: "",
      messageReview: "",
      rating: 0,
    );
  }

  void finalizeReviewForm(
    String id,
    String messageReview,
    int rating,
  ) {
    state = ReviewForm(
      orderId: id,
      messageReview: messageReview,
      rating: rating,
    );
  }

  void sendReview() {}
}
