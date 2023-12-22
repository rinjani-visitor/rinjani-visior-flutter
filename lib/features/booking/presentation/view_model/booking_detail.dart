import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/data/repository_impl.dart';
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
    developer.log("get", name: runtimeType.toString());
    if (state.value?.bookingId == bookingId) return;
    state = const AsyncLoading();
    final token =
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization();
    state = await AsyncValue.guard(() async =>
        await _bookingRepository.getBookingDetail(token, bookingId));
    developer.log("bookingID ${state.value?.bookingId}",
        name: runtimeType.toString());
  }
}
