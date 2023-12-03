import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking.dart';
import 'package:rinjani_visitor/features/booking/domain/entitiy/booking_form_status.dart';

abstract class BookingRepository {
  Future<BookingFormStatus> createBooking(
    String token,
    String userId,
    BookingFormEntity booking,
  );

  Future<List<BookingEntity>> getBookings(String token);

  Future<BookingDetailEntity> getBookingDetail(String token, String id);

  Future<BookingFormEntity> updateBooking(
    String token,
    BookingFormEntity booking,
  );

  Future<void> deleteBooking(String token, String id);
}
