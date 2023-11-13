import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/notification/data/remote/mock.dart';
import 'package:rinjani_visitor/features/notification/domain/notification_model.dart';
import 'package:rinjani_visitor/features/notification/domain/notificaton_repository.dart';

final notificationRepositoryProvider = Provider((ref) =>
    NotificationRepositoryImpl(notificationRemote: NotificationMock()));

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationMock _notificationRemote;

  NotificationRepositoryImpl({required NotificationMock notificationRemote})
      : _notificationRemote = notificationRemote;

  @override
  Future<NotificationModel> getNotification() {
    // TODO: implement getNotification
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final notifications = await _notificationRemote.getNotification();
    return notifications;
  }

  @override
  Future<void> setMarkCurrentNotification(
      {required String notificationId, bool? viewed}) {
    // TODO: implement setMarkCurrentNotification
    throw UnimplementedError();
  }
}
