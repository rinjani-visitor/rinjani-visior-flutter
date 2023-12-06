import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/data/repository_impl.dart';
import 'package:rinjani_visitor/features/booking/domain/repository/booking.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_list.dart';

final bookingNotificationViewModelProvider =
    NotifierProvider<BookingNotificationViewModel, bool>(
  BookingNotificationViewModel.new,
);

class BookingNotificationViewModel extends Notifier<bool> {
  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);
  BookingListViewModel get bookingListViewModel =>
      ref.read(bookingListViewModelProvider.notifier);
  BookingRepository get bookingRepository =>
      ref.read(bookingRepositoryProvider);
  @override
  bool build() {
    return false;
  }

// this function will return true if there is a new data in booking list
  Future<bool> getNotificationStatus() async {
    final currentBookingList = bookingListViewModel.getBookingList();
    if (currentBookingList.isEmpty) return false;
    final status =
        await bookingRepository.isBookingHaveNewEntryStatus(currentBookingList);
    state = status;
    return status;
  }
}
