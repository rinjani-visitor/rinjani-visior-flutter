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

  Future<void> deleteBooking(String token, String id);

  /// this function will return true if booking list has been visited
  Future<bool> isBookingHaveNewEntryStatus(
    List<BookingEntity> currentBookingList,
  );

  Future<void> updateBookingNewEntryStatus(
      List<BookingEntity> currentBookingList);
}
