import 'package:rinjani_visitor/features/booking/domain/enum/history_status.dart';

const bookingHistoryStatus = [
  'Offering',
  'Waiting for Payment',
  'Declined',
  'Payment Reviewing',
  'Payment Failed',
  'Success',
];

class Booking {
  final String id;
  final String title;
  final DateTime dateTime;
  final String status;
  final HistoryStatus? historyStatus;

  Booking({
    required this.id,
    this.historyStatus,
    required this.title,
    required this.dateTime,
    required this.status,
  });
}
