import 'package:rinjani_visitor/features/booking_history/domain/enum/history_status.dart';

class BookingHistoryEntity {
  final String id;
  final String title;
  final DateTime dateTime;
  final String status;
  final HistoryStatus? historyStatus;
  BookingHistoryEntity(
      {required this.id,
      this.historyStatus,
      required this.title,
      required this.dateTime,
      required this.status});
}
