import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/booking_history/domain/entitiy/booking_history.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final bookingHistoryViewModelProvider = AsyncNotifierProviderImpl<
    BookingHistoryViewModel,
    List<BookingHistoryEntity>>(() => BookingHistoryViewModel());

class BookingHistoryViewModel extends AsyncNotifier<List<BookingHistoryEntity>> {
  @override
  FutureOr<List<BookingHistoryEntity>> build() {
    return [];
  }
}
