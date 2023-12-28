import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/notification/data/remote/mock.dart';
import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';
import 'package:rinjani_visitor/features/notification/domain/notificaton_repository.dart';

final notificationRepositoryProvider = Provider((ref) =>
    NotificationRepositoryImpl(notificationRemote: NotificationMock()));

class NotificationRepositoryImpl implements NotificationRepository {

  NotificationRepositoryImpl({required NotificationMock notificationRemote});


  @override
  Future<List<NotificationEntity>> getNotifications() async {
    return [];
  }

}
