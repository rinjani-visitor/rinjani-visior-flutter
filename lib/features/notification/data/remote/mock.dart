import 'package:rinjani_visitor/features/notification/domain/notification_model.dart';
import 'package:rinjani_visitor/widget/status.dart';

class NotificationMock {
  Future<List<NotificationModel>> getNotification(
      {int page = 10, int limit = 10}) async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(
        limit,
        (index) => NotificationModel(
              id: index.toString(),
              title: 'Notification $index',
              description: 'Description $index',
              viewed: false,
              orderBookingNo: "XCV-5578-$index",
              orderDate: DateTime.now().toString(),
              status: StatusColor.waiting,
            ));
  }
}
