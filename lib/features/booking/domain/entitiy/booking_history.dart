import 'package:rinjani_visitor/features/booking/domain/enum/history_status.dart';

const bookingHistoryStatus = [
  'Offering',
  'Waiting for Payment',
  'Declined',
  'Payment Reviewing',
  'Payment Failed',
  'Success',
];

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
