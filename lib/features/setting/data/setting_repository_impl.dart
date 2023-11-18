
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/setting/data/source/local.dart';
import 'package:rinjani_visitor/features/setting/domain/setting_enum.dart';
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
  Future<SettingModel> getSettings() async {
    final stringData = await source.fetchSettingPreferences();
    if (stringData.isEmpty) {
      return SettingModel(languageCode: LangCode.enUS, currency: Currency.USD);
    }
    try {
      return SettingModel(languageCode: LangCode.enUK, currency: Currency.IDR);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<SettingModel> updateSettings(SettingModel settings) async {
    try {
      return SettingModel(languageCode: LangCode.enUK, currency: Currency.IDR);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
