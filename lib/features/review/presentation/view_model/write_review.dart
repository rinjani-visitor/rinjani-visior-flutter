import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/review/data/review_repo.dart';
import 'package:rinjani_visitor/features/review/domain/entity/review_form.dart';
import 'package:rinjani_visitor/features/review/domain/repo/review.dart';

final reviewFormViewModelProvider =
    NotifierProvider<ReviewFormViewModel, ReviewForm>(
        ReviewFormViewModel.new);

class ReviewFormViewModel extends Notifier<ReviewForm> {
  ReviewRepository get repository => ref.read(reviewRepositoryProvider);
  AuthViewModel get authViewModel => ref.read(authViewModelProvider.notifier);
  @override
  ReviewForm build() {
    developer.log("build", name: "ReviewFormViewModel");
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
    developer.log("finalizeReviewForm", name: "ReviewFormViewModel");
    state = ReviewForm(
      orderId: id,
      messageReview: messageReview,
      rating: rating,
    );
  }

  Future<String?> sendReview() async  {
    developer.log("sendReview", name: "ReviewFormViewModel");
    final token = authViewModel.getAccessToken();
    final result = await repository.createReview(token!, state);
    return result;
  }
}
