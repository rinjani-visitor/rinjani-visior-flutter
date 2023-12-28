import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/presentation/utils/internationalization.dart';
import 'package:rinjani_visitor/features/notification/domain/entity/notification.dart';
import 'package:rinjani_visitor/core/presentation/widget/status.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  String id;
  String title;
  String description;
  String orderBookingNo;
  String orderDate;
  bool viewed;
  StatusColor? status;

  String get date => dateFormat.format(DateTime.parse(orderDate));

  NotificationModel({
    required this.id,
    required this.description,
    required this.title,
    required this.orderBookingNo,
    required this.orderDate,
    required this.viewed,
    this.status,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  NotificationEntity toEntity() => NotificationEntity(
      id: id,
      title: title,
      description: description,
      orderBookingNo: orderBookingNo,
      orderDate: orderDate,
      viewed: viewed);
}
