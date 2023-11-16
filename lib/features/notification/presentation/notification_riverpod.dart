

import 'package:rinjani_visitor/features/notification/data/notification_repository_impl.dart';
import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_riverpod.g.dart';

@Riverpod(keepAlive: true)
class NotificationRiverpod extends _$NotificationRiverpod{
  @override
  FutureOr<List<NotificationEntity>> build() async {
    final data = await ref.read(notificationRepositoryProvider).getNotifications();
    return data;
  }
}