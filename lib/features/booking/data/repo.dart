import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/booking/data/models/request/post_booking.dart';
import 'package:rinjani_visitor/features/booking/data/source/remote.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';

import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form_status.dart';

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
    try {
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
  Future<BookingDetailEntity> getBookingDetail(String token, String id) async {
    try {
      final result = await remote.getBookingDetail(token, id);
      return result.toEntity();
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<List<BookingEntity>> getBookings(String token) async {
    try {
      final result = await remote.getBookings(token);
      return result.toEntity() ?? [];
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<BookingFormEntity> updateBooking(
      String token, BookingFormEntity booking) {
    // TODO: implement updateBooking
    throw UnimplementedError();
  }
}
