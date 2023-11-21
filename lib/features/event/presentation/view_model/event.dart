import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/product/domain/entity/event.dart';

final eventViewModelProvider =
    AutoDisposeAsyncNotifierProvider<EventViewModel, List<EventEntity>>(
        () => EventViewModel());

class EventViewModel extends AutoDisposeAsyncNotifier<List<EventEntity>> {
  @override
  FutureOr<List<EventEntity>> build() {
    return [];
  }
}
