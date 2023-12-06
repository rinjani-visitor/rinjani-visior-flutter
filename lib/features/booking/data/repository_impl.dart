import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/core/presentation/utils/crypto.dart';
import 'package:rinjani_visitor/features/booking/data/models/request/post_booking.dart';
import 'package:rinjani_visitor/features/booking/data/source/local.dart';
import 'package:rinjani_visitor/features/booking/data/source/remote.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import "package:crypto/crypto.dart";
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/repository/booking.dart';

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  final dio = ref.read(dioServiceProvider);
  return BookingRepositoryImpl(remote: RemoteBookingDataSource(dio));
});

class BookingRepositoryImpl implements BookingRepository {
  RemoteBookingDataSource remote;
  BookingRepositoryImpl({required this.remote});
  @override
  Future<BookingFormStatus> createBooking(
      String token, String userId, BookingFormEntity booking) async {
    final body = PostBookingRequest(
      productId: booking.product!.id,
      userId: userId,
      startDateTime: booking.startDateTime.toIso8601String(),
      endDateTime: booking.endDateTime?.toIso8601String(),
      addOns: booking.addOns.join(', '),
      offeringPrice: booking.offeringPrice.toString(),
      totalPersons: booking.totalPersons,
    );
    final result = await remote.createBooking(token, body);
    final response = BookingFormStatus(
      status: result.errors != null || result.errors!.isNotEmpty,
      message: result.message,
    );
    return response;
  }

  @override
  Future<void> deleteBooking(String token, String id) async {
    final _ = await remote.deleteBooking(token, id);
    return;
  }

  @override
  Future<BookingDetailEntity> getBookingDetail(String token, String id) async {
    final result = await remote.getBookingDetail(token, id);
    return result.toEntity();
  }

  @override
  Future<List<BookingEntity>> getBookings(String token) async {
    final result = await remote.getBookings(token);
    return result.toEntity() ?? [];
  }

  @override
  Future<BookingFormEntity> updateBooking(
      String token, BookingFormEntity booking) {
    // TODO: implement updateBooking
    throw UnimplementedError();
  }

  @override
  Future<bool> isBookingHaveNewEntryStatus(
      List<BookingEntity> currentBookingList) async {
    final sharedPreference = await SharedPreferences.getInstance();

    // create MD5 hash string from status and id value at booking list
    // please do not add any other value to this conversion process
    final currentHash = Crypto.toMd5(
      currentBookingList
          .map((e) => "${e.bookingStatus.name}${e.bookingId}")
          .toList()
          .join(''),
    );

    final savedHash =
        sharedPreference.getString(LocalBookingSource.BOOKING_NOTIFICATION_KEY);
    if (savedHash == null) {
      return true;
    }
    if (savedHash != currentHash) {
      return true;
    }
    return false;
  }

  @override
  Future<void> updateBookingNewEntryStatus(
    List<BookingEntity> currentBookingList,
  ) async {
    final sharedPreference = await SharedPreferences.getInstance();

    // create MD5 hash string from status and id value at booking list
    // please do not add any other value to this conversion process
    final currentHash = Crypto.toMd5(
      currentBookingList
          .map((e) => "${e.bookingStatus.name}${e.bookingId}")
          .toList()
          .join(''),
    );
    await sharedPreference.setString(
      LocalBookingSource.BOOKING_NOTIFICATION_KEY,
      currentHash,
    );
  }
}
