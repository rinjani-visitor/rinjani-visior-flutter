import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel(
      {required String title,
      required String imgUrl,
      required String dateTime,
      required String? description}) = _EventModel;
  factory EventModel.fromJson(Map<String, Object?> json) =>
      _$EventModelFromJson(json);
}
