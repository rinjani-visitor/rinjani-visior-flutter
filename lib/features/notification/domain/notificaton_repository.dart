import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/notification/domain/notification_model.dart';

abstract class NotificationRepository {
  Future<List<NotificationModel>> fetchNotification();
  Future<LocalState> refreshCurrentNotificationItem();
}
