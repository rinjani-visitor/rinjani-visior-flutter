import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/notification/domain/notification_model.dart';

abstract class NotificationRepository {
  /// get newest notification information
  Future<List<NotificationModel>> fetchNotification();

  /// mark current notification as viewed or not
  Future<void> setMarkCurrentNotification(
      {required String notificationId, bool? viewed});
}
