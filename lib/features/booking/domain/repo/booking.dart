import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_history.dart';

abstract class BookingHistoryRepository {
  Future<void> createBooking(BookingEntity booking);
  Future<List<BookingHistoryEntity>> getBookings();
  Future<BookingHistoryEntity> getBookingDetail(String id);
  Future<BookingEntity> updateBooking(BookingEntity booking);
}
