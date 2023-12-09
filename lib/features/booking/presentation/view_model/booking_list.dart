import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/data/repository_impl.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/repository/booking.dart';
import 'package:rinjani_visitor/features/booking/presentation/view_model/booking_notification.dart';

final bookingListViewModelProvider =
    AutoDisposeAsyncNotifierProvider<BookingListViewModel, List<BookingEntity>>(
        BookingListViewModel.new);

class BookingListViewModel
    extends AutoDisposeAsyncNotifier<List<BookingEntity>> {
  AuthViewModel get auth => ref.read(authViewModelProvider.notifier);

  BookingRepository get bookingRepository =>
      ref.read(bookingRepositoryProvider);

  BookingNotificationViewModel get bookingNotificationViewModel =>
      ref.read(bookingNotificationViewModelProvider.notifier);

  @override
  FutureOr<List<BookingEntity>> build() async {
    final token = auth.getAccessToken();
    final lists = await bookingRepository.getBookings(token!);
    ref
        .read(bookingNotificationViewModelProvider.notifier)
        .getNotificationStatus(lists: lists);
    return lists;
  }

  void onPageRefresh() async {
    developer.log("Refresh Emit", name: runtimeType.toString());
    final token = auth.getAccessToken();
    final lists = await AsyncValue.guard(
        () async => await bookingRepository.getBookings(token!));
    ref
        .read(bookingNotificationViewModelProvider.notifier)
        .getNotificationStatus(
          lists: lists.value,
          updateEntry: true,
        );
    final value = lists.value;
    state = value != null ? lists : state;
  }

  Future<void> deleteBooking(String id) async {
    final token = auth.getAccessToken()!;
    return bookingRepository.deleteBooking(token, id);
  }

  List<BookingEntity> getBookingList() {
    return state.value ?? [];
  }
}
