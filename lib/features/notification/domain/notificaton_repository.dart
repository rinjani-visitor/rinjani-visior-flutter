import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';

abstract class NotificationRepository {
  /// get newest list of notification
  Future<List<NotificationEntity>> getNotifications();
}
