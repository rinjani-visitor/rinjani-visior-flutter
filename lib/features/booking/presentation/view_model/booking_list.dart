import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/data/repository_impl.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/repository/booking.dart';

final bookingListViewModelProvider =
    AutoDisposeAsyncNotifierProvider<BookingListViewModel, List<BookingEntity>>(
        BookingListViewModel.new);

class BookingListViewModel
    extends AutoDisposeAsyncNotifier<List<BookingEntity>> {
  AuthViewModel get auth => ref.read(authViewModelProvider.notifier);
  BookingRepository get bookingRepository =>
      ref.read(bookingRepositoryProvider);

  @override
  FutureOr<List<BookingEntity>> build() {
    final token = auth.getAccessToken();
    return bookingRepository.getBookings(token!);
  }

  Future<void> deleteBooking(String id) async {
    final token = auth.getAccessToken()!;
    return bookingRepository.deleteBooking(token, id);
  }
}
