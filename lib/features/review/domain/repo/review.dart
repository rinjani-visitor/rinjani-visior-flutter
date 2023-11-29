import 'package:rinjani_visitor/features/review/domain/entity/review.dart';
import 'package:rinjani_visitor/features/review/domain/entity/review_form.dart';

abstract class ReviewRepository {
  Future<String?> createReview(String token, ReviewForm entity);
}
