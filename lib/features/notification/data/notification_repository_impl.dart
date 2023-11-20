import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/notification/data/remote/mock.dart';
import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';
import 'package:rinjani_visitor/features/notification/domain/notificaton_repository.dart';

final notificationRepositoryProvider = Provider((ref) =>
    NotificationRepositoryImpl(notificationRemote: NotificationMock()));

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationMock _notificationRemote;

  NotificationRepositoryImpl({required NotificationMock notificationRemote})
      : _notificationRemote = notificationRemote;

  @override
  Future<NotificationEntity> getNotification() {
    // TODO: implement getNotification
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    final notifications = await _notificationRemote.getNotification();
    final entity = notifications.map((e) => e.toEntity()).toList();
    return entity;
  }

  @override
  Future<void> setMarkCurrentNotification(
      {required String notificationId, bool? viewed}) {
    // TODO: implement setMarkCurrentNotification
    throw UnimplementedError();
  }
}
