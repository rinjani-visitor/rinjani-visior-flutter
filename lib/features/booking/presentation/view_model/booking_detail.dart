import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/data/repo.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/repository/booking.dart';

final bookingDetailViewModelProvider =
    AsyncNotifierProvider<BookingDetailViewModel, BookingDetailEntity?>(
        BookingDetailViewModel.new);

class BookingDetailViewModel extends AsyncNotifier<BookingDetailEntity?> {
  BookingRepository get _bookingRepository =>
      ref.read(bookingRepositoryProvider);

  @override
  FutureOr<BookingDetailEntity?> build() {
    return null;
  }

  void get(String bookingId) async {
    if (state.value?.bookingId == bookingId) return;
    state = const AsyncLoading();
    final token =
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization();
    state = await AsyncValue.guard(() async =>
        await _bookingRepository.getBookingDetail(token, bookingId));
  }
}
