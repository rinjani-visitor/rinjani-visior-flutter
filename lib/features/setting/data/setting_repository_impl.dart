import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/setting/data/source/local.dart';
import 'package:rinjani_visitor/features/setting/domain/setting_model.dart';
import 'package:rinjani_visitor/features/setting/domain/setting_repository.dart';

class SettingRepositoryImpt implements SettingRepository {
  final SettingLocalSource source;

  SettingRepositoryImpt({required this.source});

  static final provider = Provider((ref) {
    return SettingRepositoryImpt(
        source: ref.watch(SettingLocalSource.provider));
  });

  @override
  LocalState<SettingModel> getSettings() {
    final stringData = source.fetchSettingPreferences();
    try {
      final jsonData = jsonDecode(stringData);
      final data = SettingModel.fromJson(jsonData);
      return LocalResult(data);
    } on Exception catch (e) {
      return LocalError(e);
    }
  }

  @override
  Stream<LocalState<SettingModel>> updateSettings(
      SettingModel settings) async* {
    yield const LocalLoading();
    final settingsData = settings.toJson().toString();
    final stringData = await source.updateSettingPreference(settingsData);
    try {
      final jsonData = jsonDecode(stringData);
      final data = SettingModel.fromJson(jsonData);
      yield LocalResult(data);
    } on Exception catch (e) {
      yield LocalError(e);
    }
  }
}
