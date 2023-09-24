//TODO: need to wait for backend team before define this auth entity

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({required String name, required String description}) =
      _AuthModel;
  factory AuthModel.fromJson(Map<String, Object> json) =>
      _$AuthModelFromJson(json);
}
