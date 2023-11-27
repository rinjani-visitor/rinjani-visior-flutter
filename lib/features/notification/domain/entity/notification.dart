import 'package:rinjani_visitor/core/widget/status.dart';

class NotificationEntity {
  final String id;
  final String title;
  final String description;
  final String orderBookingNo;
  final String orderDate;
  final bool viewed;
  final StatusColor? status;

  NotificationEntity(
      {this.status,
      required this.id,
      required this.title,
      required this.description,
      required this.orderBookingNo,
      required this.orderDate,
      required this.viewed});
}
