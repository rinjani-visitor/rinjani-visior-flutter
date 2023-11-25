import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/notification/data/notification_repository_impl.dart';
import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';

final notificationViewModelProvider =
    AsyncNotifierProvider<NotificationViewModel, List<NotificationEntity>>(
        () => NotificationViewModel());

class NotificationViewModel extends AsyncNotifier<List<NotificationEntity>> {
  @override
  FutureOr<List<NotificationEntity>> build() async {
    final data =
        await ref.read(notificationRepositoryProvider).getNotifications();
    return data;
  }
}
