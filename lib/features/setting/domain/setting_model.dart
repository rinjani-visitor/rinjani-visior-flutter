import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'setting_enum.dart';
part 'setting_model.freezed.dart';
part 'setting_model.g.dart';

@unfreezed
class SettingModel with _$SettingModel {
  factory SettingModel(
      {required LangCode languageCode,
      required Currency currency}) = _SettingModel;
  factory SettingModel.fromJson(Map<String, Object?> json) =>
      _$SettingModelFromJson(json);
}
