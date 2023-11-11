import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';

part 'event_model.freezed.dart';

@freezed
abstract class EventModel with _$EventModel {
  const factory EventModel({
    required String name,
    required String imgUrl,
    required DateTime date,
    required String description,
    required List<ProductModel> products,
  }) = _EventModel;
}
