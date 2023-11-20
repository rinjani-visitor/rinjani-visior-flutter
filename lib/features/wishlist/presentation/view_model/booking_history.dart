import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/booking_history/domain/entitiy/booking_history.dart';

final bookingHistoryViewModelProvider =
    AsyncNotifierProvider<BookingHistoryViewModel, List<BookingHistoryEntity>>(
        () => BookingHistoryViewModel());

class BookingHistoryViewModel
    extends AsyncNotifier<List<BookingHistoryEntity>> {
  @override
  FutureOr<List<BookingHistoryEntity>> build() {
    return [];
  }
}
