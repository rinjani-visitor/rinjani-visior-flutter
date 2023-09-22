import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/setting/data/setting_repository_impl.dart';
import 'package:rinjani_visitor/features/setting/domain/setting_enum.dart';
import 'package:rinjani_visitor/features/setting/domain/setting_model.dart';

class SettingRiverpod extends ChangeNotifier {
  SettingRepositoryImpt repository;
  SettingModel? setting;
  SettingRiverpod({required this.repository});

  static final provider = Provider<SettingRiverpod>((ref) {
    return SettingRiverpod(
        repository: ref.read(SettingRepositoryImpt.provider));
  });

  SettingModel getSettings() {
    final data = repository.getSettings();
    if (data is LocalResult) {
      setting = data.data;
    } else {
      setting =
          SettingModel(languageCode: LangCode.enUS, currency: Currency.usd);
    }
    return setting!;
  }

  void changeLanguage(LangCode code) {
    setting?.languageCode = code;
  }

  void changeCurrency(Currency currency) {
    setting?.currency = currency;
  }
}
