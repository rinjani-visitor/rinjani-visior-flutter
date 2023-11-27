import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/review/domain/entity/review.dart';

final reviewsViewModelProvider =
    AutoDisposeAsyncNotifierProvider<ReviewsViewModel, List<ReviewEntity>>(
        () => ReviewsViewModel());

class ReviewsViewModel extends AutoDisposeAsyncNotifier<List<ReviewEntity>> {
  @override
  FutureOr<List<ReviewEntity>> build() {
    return [];
  }

  void refresh() {}
}
