import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingLocalSource {
  // ignore: constant_identifier_names
  static const SETTING_DATA = "setting_data";
  // ignore: constant_identifier_names
  static const JWT_TOKEN = 'jwt_token';

  static final provider = Provider<SettingLocalSource>((ref) {
    return SettingLocalSource();
  });

///////////////////////////////////////////////////////
  Future<String> fetchSettingPreferences() async {
    final pref = await SharedPreferences.getInstance();
    final stringData = pref.getString(SETTING_DATA) ?? "";
    return stringData;
  }

  Future<String> updateSettingPreference(String stringifyJsonData) async {
    final pref = await SharedPreferences.getInstance();
    final status = await pref.setString(SETTING_DATA, stringifyJsonData);
    if (status) return stringifyJsonData;
    return "";
  }
}
