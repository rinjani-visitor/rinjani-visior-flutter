import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rinjani_visitor/features/notification/domain/notification_enum.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel(
      {required String notificationId,
      required String title,
      required String description,
      required String orderBookingNo,
      required String orderDate,
      NotificationStatus? status}) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object> json) =>
      _$NotificationModelFromJson(json);
}
