import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rinjani_visitor/core/utils/json_utils.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';
import 'package:rinjani_visitor/features/secure_storage/presentation/secure_storage_riverpod.dart';

class AuthLocalSource {
  // ignore: constant_identifier_names
  static const TOKEN_KEY = "token_key";
  // ignore: constant_identifier_names
  static const SESSION_KEY = "session_key";
  // ignore: constant_identifier_names
  static const NAME = "AuthLocalStorage";
  final FlutterSecureStorage storage;

  AuthLocalSource({required this.storage});

  static final provider = Provider(
      (ref) => AuthLocalSource(storage: ref.read(secureStorageProvider)));

  Future<void> setToken(String token) async {
    await storage.write(key: AuthLocalSource.TOKEN_KEY, value: token);
  }

  Future<String> getToken() async {
    return await storage.read(key: AuthLocalSource.TOKEN_KEY) ?? "";
  }

  Future<void> removeToken() async {
    await storage.delete(key: AuthLocalSource.TOKEN_KEY);
  }

  Future<AuthModel?> getSession() async {
    final data = await storage.read(key: AuthLocalSource.SESSION_KEY) ?? "";
    debugPrint("$NAME : current session - $data");
    if (data.isNotEmpty) {
      final result = JsonParser.stringToJson(data);
      return AuthModel.fromJson(result);
    }
    return null;
  }

  Future<void> setSession(AuthModel session) async {
    final stringJson = JsonParser.jsonToString(session.toJson());
    await storage.write(key: AuthLocalSource.SESSION_KEY, value: stringJson);
    return;
  }
}
