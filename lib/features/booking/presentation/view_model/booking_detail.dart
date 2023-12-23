import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/booking/data/repository_impl.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/repository/booking.dart';

final bookingDetailViewModelProvider = AutoDisposeAsyncNotifierProvider.family<
    BookingDetailViewModel,
    BookingDetailEntity?,
    String>(BookingDetailViewModel.new);

class BookingDetailViewModel
    extends AutoDisposeFamilyAsyncNotifier<BookingDetailEntity?, String> {
  BookingRepository get _bookingRepository =>
      ref.read(bookingRepositoryProvider);

  @override
  FutureOr<BookingDetailEntity?> build(String arg) async {
    developer.log("build $arg", name: runtimeType.toString());
    final token =
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization();
    final result = await _bookingRepository.getBookingDetail(token, arg);
    developer.log("bookingID ${result.bookingId}",
        name: runtimeType.toString());
    return result;
  }
}
