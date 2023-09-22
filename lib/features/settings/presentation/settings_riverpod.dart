import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/shared_preferences/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageSettings extends ChangeNotifier {
  SharedPreferences? pref;
  StorageSettings({required this.pref});

  static final provider = Provider((ref) {
    final pref = ref
        .watch(sharedPreferencesProvider)
        .maybeWhen(data: (value) => value, orElse: () => null);
    return StorageSettings(pref: pref);
  });

  String? language(String? langCode) {
    if (langCode != null) {
      pref?.setString("lang_code", langCode);
    }
    return pref?.getString("lang_code");
  }
}
