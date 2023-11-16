import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rinjani_visitor/core/presentation/utils/json_utils.dart';
import 'package:rinjani_visitor/features/authentication/data/models/auth_model.dart';
import 'package:rinjani_visitor/features/secure_storage/presentation/secure_storage_riverpod.dart';

class AuthLocalSource {
  // ignore: constant_identifier_names
  static const SESSION_KEY = "session_key";
  // ignore: constant_identifier_names
  static const NAME = "AuthLocalStorage";
  final FlutterSecureStorage storage;

  AuthLocalSource({required this.storage});

  static final provider = Provider(
      (ref) => AuthLocalSource(storage: ref.read(secureStorageProvider)));

  Future<String?> getSession() async {
    final data = await storage.read(key: SESSION_KEY) ?? "";
    debugPrint("$NAME : current session - $data");
    if (data.isNotEmpty) {
      return data;
    }
    return null;
  }

  Future<void> setSession(String? token) async {
    if (token == null) return;
    await storage.write(key: SESSION_KEY, value: token);
  }

  Future<void> clearSession() async {
    await storage.delete(key: SESSION_KEY);
  }
}
