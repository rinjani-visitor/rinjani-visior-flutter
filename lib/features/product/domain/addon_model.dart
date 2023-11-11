import 'package:freezed_annotation/freezed_annotation.dart';

part 'addon_model.freezed.dart';

part 'addon_model.g.dart';

@freezed
class AddOnModel with _$AddOnModel {
  get pricing => "${price.toString()}\$";
  const AddOnModel._();
  const factory AddOnModel(
      {
      /// Add on name, will be displayed as add on name
      required String name,

      /// Add on description, will be displayed as tooltip
      String? description,

      /// price value that has been formatted
      ///
      required int price,

      /// Add on id
      required String id}) = _AddOnModel;

  factory AddOnModel.fromJson(Map<String, dynamic> json) =>
      _$$AddOnModelImplFromJson(json);
}
