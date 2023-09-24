import 'package:rinjani_visitor/features/setting/domain/setting_model.dart';

abstract class SettingRepository {
  Future<SettingModel> getSettings();
  Future<SettingModel> updateSettings(SettingModel settings);
}
