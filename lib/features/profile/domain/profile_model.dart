import 'package:freezed_annotation/freezed_annotation.dart';

part "profile_model.freezed.dart";
part "profile_model.g.dart";

@unfreezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    required String name,
    required String email,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
