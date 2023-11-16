import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rinjani_visitor/core/presentation/services/secure_storage_service.dart';

final authLocalSourceProvider =
    Provider((ref) => AuthLocalSource(storage: ref.read(secureStorageService)));

class AuthLocalSource {
  // ignore: constant_identifier_names
  static const SESSION_KEY = "session_key";
  // ignore: constant_identifier_names
  static const NAME = "AuthLocalStorage";
  final FlutterSecureStorage storage;

  AuthLocalSource({required this.storage});

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
