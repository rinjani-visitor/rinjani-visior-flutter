import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';
import 'package:rinjani_visitor/widget/status.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  String get date => dateFormat.format(DateTime.parse(orderDate));
  const NotificationModel._();
  const factory NotificationModel(
      {required String id,
      required String title,
      required String description,
      required String orderBookingNo,
      required String orderDate,
      required bool viewed,
      StatusColor? status}) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object> json) =>
      _$NotificationModelFromJson(json);

  NotificationEntity toEntity() => NotificationEntity(id: id, title: title, description: description, orderBookingNo: orderBookingNo, orderDate: orderDate, viewed: viewed);
}
