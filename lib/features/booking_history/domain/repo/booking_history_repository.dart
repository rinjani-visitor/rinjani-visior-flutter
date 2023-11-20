import 'package:rinjani_visitor/features/booking_history/domain/entitiy/booking_history.dart';

abstract class BookingHistoryRepository {
  Future<List<BookingHistoryEntity>> getBookingHistories();
  Future<List<BookingHistoryEntity>> getBookingHistory(String id);
}
