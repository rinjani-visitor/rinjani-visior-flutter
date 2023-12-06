import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/data/repository_impl.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
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

  // Future<void> updateBookingNotificationStatus() async {
  //   developer.log("updateBookingNotificationStatus",name: runtimeType.toString());
  //   final lists = bookingListViewModel.getBookingList();
  //   await bookingRepository.updateBookingNewEntryStatus(lists);
  //   final status = await bookingRepository.isBookingHaveNewEntryStatus(lists);
  //   developer.log("status: ${status}", name: runtimeType.toString());
  //   state = status;
  // }

// this function will return true if there is a new data in booking list
  Future<bool> getNotificationStatus(
      {List<BookingEntity>? lists, bool updateEntry = false}) async {
    developer.log("getNotificationStatus",name: runtimeType.toString());
    final currentBookingList = lists ?? bookingListViewModel.getBookingList();
    if (currentBookingList.isEmpty) return false;
    if (updateEntry) {

      await bookingRepository.updateBookingNewEntryStatus(currentBookingList);
    }
    final status =
        await bookingRepository.isBookingHaveNewEntryStatus(currentBookingList);
    developer.log("status: ${status}", name: runtimeType.toString());
    state = status;
    return status;
  }
}
