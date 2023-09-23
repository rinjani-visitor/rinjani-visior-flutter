// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/setting/data/setting_repository_impl.dart';
import 'package:rinjani_visitor/features/setting/data/source/local.dart';
import 'package:rinjani_visitor/features/setting/domain/setting_model.dart';
import 'package:rinjani_visitor/features/setting/presentation/setting_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingLocalSource = Provider<SettingLocalSource>((ref) {
  return SettingLocalSource();
});

final repository = Provider(
    (ref) => SettingRepositoryImpt(source: ref.read(settingLocalSource)));

final presentationRiverpod =
    Provider((ref) => SettingRiverpod(repository: ref.watch(repository)));

void main() {
  test(
      "settings provider integration must return result data with SettingModel",
      () async {
    SharedPreferences.setMockInitialValues(
        {"setting_data": '{"languageCode": "enUS", "currency":"IDR"}'});
    final container = ProviderContainer();
    final data = container.read(repository).getSettings();
    final result = await data.last;
    expect(result.runtimeType, LocalResult<SettingModel>);
    print(result.data.toString());
  });
}
