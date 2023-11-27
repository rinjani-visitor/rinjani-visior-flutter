import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';

abstract class BookingHistoryRepository {
  Future<void> createBooking(BookingFormEntity booking);
  Future<List<Booking>> getBookings();
  Future<Booking> getBookingDetail(String id);
  Future<BookingFormEntity> updateBooking(BookingFormEntity booking);
}
