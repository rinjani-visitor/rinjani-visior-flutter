import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/notification/data/remote/mock.dart';
import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';
import 'package:rinjani_visitor/features/notification/domain/notificaton_repository.dart';

final notificationRepositoryProvider = Provider((ref) =>
    NotificationRepositoryImpl(notificationRemote: NotificationMock()));

class NotificationRepositoryImpl implements NotificationRepository {

  NotificationRepositoryImpl({required NotificationMock notificationRemote});

  @override
  Future<NotificationEntity> getNotification() {
    // TODO: implement getNotification
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    return [];
  }

  @override
  Future<void> setMarkCurrentNotification(
      {required String notificationId, bool? viewed}) {
    // TODO: implement setMarkCurrentNotification
    throw UnimplementedError();
  }
}
