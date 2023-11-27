import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/booking/data/models/request/post_booking.dart';
import 'package:rinjani_visitor/features/booking/data/source/remote.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';

import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';

import '../domain/repository/booking.dart';

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  final dio = ref.read(dioServiceProvider);
  return BookingRepositoryImpl(remote: RemoteBookingDataSource(dio));
});

class BookingRepositoryImpl implements BookingRepository {
  RemoteBookingDataSource remote;
  BookingRepositoryImpl({required this.remote});
  @override
  Future<bool> createBooking(String token, BookingFormEntity booking) async {
    try {
      final body = PostBookingRequest(
        productId: booking.productId,
        startDateTime: booking.startDateTime.toIso8601String(),
        endDateTime: booking.endDateTime?.toIso8601String(),
        addOns: booking.addOns.toString(),
        offeringPrice: booking.offeringPrice.toString(),
        totalPersons: booking.totalPersons,
      );
      final result = await remote.createBooking(body);
      final response = result.errors != null ? false : true;
      return response;
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<void> deleteBooking(String token, String id) {
    // TODO: implement deleteBooking
    throw UnimplementedError();
  }

  @override
  Future<Booking> getBookingDetail(String token, String id) {
    // TODO: implement getBookingDetail
    throw UnimplementedError();
  }

  @override
  Future<List<Booking>> getBookings(String token) {
    // TODO: implement getBookings
    throw UnimplementedError();
  }

  @override
  Future<BookingFormEntity> updateBooking(
      String token, BookingFormEntity booking) {
    // TODO: implement updateBooking
    throw UnimplementedError();
  }
}
