import 'package:rinjani_visitor/features/notification/data/notification_repository_impl.dart';
import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final notificationRiverpodProvider =
    AsyncNotifierProviderImpl(() => NotificationRiverpod());

class NotificationRiverpod extends AsyncNotifier<List<NotificationEntity>> {
  @override
  FutureOr<List<NotificationEntity>> build() async {
    final data =
        await ref.read(notificationRepositoryProvider).getNotifications();
    return data;
  }
}
