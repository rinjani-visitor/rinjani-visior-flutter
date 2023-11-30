import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/review/data/repository_impl.dart';
import 'package:rinjani_visitor/features/review/domain/entity/review_form.dart';
import 'package:rinjani_visitor/features/review/domain/repo/review.dart';

final reviewFormViewModelProvider =
    AutoDisposeNotifierProvider<ReviewFormViewModel, ReviewForm>(
        ReviewFormViewModel.new);

class ReviewFormViewModel extends AutoDisposeNotifier<ReviewForm> {
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

  Future<String?> sendReview() async {
    developer.log("sendReview", name: "ReviewFormViewModel");
    final token = authViewModel.getAccessToken();
    try {
      final result = await repository.createReview(token!, state);
      return result;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;
  }
}
