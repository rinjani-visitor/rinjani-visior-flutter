import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/shared_preferences/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingLocalSource {
  final SharedPreferences pref;
  // ignore: constant_identifier_names
  static const SETTING_DATA = "setting_data";

  SettingLocalSource({required this.pref});

  static final provider = Provider<SettingLocalSource>((ref) {
    final pref = ref.read(sharedPreferencesProvider).maybeWhen(
          data: (data) => data,
          orElse: () => null,
        );
    return SettingLocalSource(pref: pref!);
  });

///////////////////////////////////////////////////////
  String fetchSettingPreferences() {
    final stringData = pref.getString(SETTING_DATA) ?? "";
    return stringData;
  }

  Future<String> updateSettingPreference(String stringifyJsonData) async {
    final status = await pref.setString(SETTING_DATA, stringifyJsonData);
    if (status) return stringifyJsonData;
    return "";
  }
}
