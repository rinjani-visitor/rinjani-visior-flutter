import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';

abstract class NotificationRepository {
  /// get newest list of notification
  Future<List<NotificationEntity>> getNotifications();
  Future<NotificationEntity> getNotification();

  /// mark current notification as viewed or not
  Future<void> setMarkCurrentNotification(
      {required String notificationId, bool? viewed});
}
