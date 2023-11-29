import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/review/data/models/request/request.dart';
import 'package:rinjani_visitor/features/review/data/source/remote.dart';
import 'package:rinjani_visitor/features/review/domain/entity/review_form.dart';
import 'package:rinjani_visitor/features/review/domain/repo/review.dart';

final reviewRepositoryProvider = Provider<ReviewRepository>(
  (ref) => ReviewRepositoryImpl(
    remote: RemoteReviewDataSource(ref.read(dioServiceProvider)),
  ),
);

class ReviewRepositoryImpl implements ReviewRepository {
  final RemoteReviewDataSource remote;

  ReviewRepositoryImpl({required this.remote});
  @override
  Future<String?> createReview(String token, ReviewForm entity) async {
    final request = PostReviewRequest(
      orderId: entity.orderId,
      messageReview: entity.messageReview,
      rating: entity.rating.toString(),
    );
    final result = await remote.postReview(token, request);
    return result.message;
  }
}
