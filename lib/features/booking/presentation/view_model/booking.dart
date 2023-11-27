import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/data/repo.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/repository/booking.dart';

final bookingViewModelProvider =
    AutoDisposeAsyncNotifierProvider<BookingViewModel, List<BookingEntity>>(
        BookingViewModel.new);

class BookingViewModel extends AutoDisposeAsyncNotifier<List<BookingEntity>> {
  AuthViewModel get auth => ref.read(authViewModelProvider.notifier);
  BookingRepository get bookingRepository =>
      ref.read(bookingRepositoryProvider);

  @override
  FutureOr<List<BookingEntity>> build() {
    final token = auth.state.value?.toAccessTokenAuthorization();
    return bookingRepository.getBookings(token!);
  }
}
