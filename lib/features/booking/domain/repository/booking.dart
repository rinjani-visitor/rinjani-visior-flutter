import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';

abstract class BookingRepository {
  Future<bool> createBooking(String token, BookingFormEntity booking);
  Future<List<Booking>> getBookings(String token);
  Future<Booking> getBookingDetail(String token, String id);
  Future<BookingFormEntity> updateBooking(
      String token, BookingFormEntity booking);
  Future<void> deleteBooking(String token, String id);
}
