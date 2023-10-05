import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
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
    final data = await container.read(repository).getSettings();
    final result = data;
    expect(result, isA<SettingModel>());
  });
  test(
      "settings repository should return error if data in storage is not provided / invalid",
      () async {
    var result = null;
    SharedPreferences.setMockInitialValues({"setting_data": ''});
    final container = ProviderContainer();
    try {
      final data = await container.read(repository).getSettings();
    } on Exception catch (e) {
      result = e;
    }
    expect(result, isA<Exception>());
  });
}
