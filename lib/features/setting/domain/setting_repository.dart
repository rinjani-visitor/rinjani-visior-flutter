import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/setting/domain/setting_model.dart';

abstract class SettingRepository {
  LocalState<SettingModel> getSettings();
  Stream<LocalState<SettingModel>> updateSettings(SettingModel settings);
}
