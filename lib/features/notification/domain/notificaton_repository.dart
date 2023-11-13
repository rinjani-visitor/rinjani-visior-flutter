import 'package:rinjani_visitor/features/notification/domain/notification_model.dart';

abstract class NotificationRepository {
  /// get newest list of notification
  Future<List<NotificationModel>> getNotifications();
  Future<NotificationModel> getNotification();

  /// mark current notification as viewed or not
  Future<void> setMarkCurrentNotification(
      {required String notificationId, bool? viewed});
}
