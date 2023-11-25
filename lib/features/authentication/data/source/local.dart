import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rinjani_visitor/core/presentation/services/secure_storage_service.dart';
import 'package:rinjani_visitor/features/authentication/data/models/token.dart';

final authLocalSourceProvider =
    Provider((ref) => AuthLocalSource(storage: ref.read(secureStorageService)));

class AuthLocalSource {
  // ignore: constant_identifier_names
  static const SESSION_KEY = "session_key";
  // ignore: constant_identifier_names
  static const NAME = "AuthLocalStorage";
  final FlutterSecureStorage storage;

  AuthLocalSource({required this.storage});

  Future<TokenModel?> getSession() async {
    final data = await storage.read(key: SESSION_KEY);
    debugPrint("$NAME : current session - $data");
    if (data != null) {
      return TokenModel.fromJson(jsonDecode(data));
    }
    return null;
  }

  Future<void> setSessionModel(TokenModel tokens) async {
    debugPrint("$NAME : set session - ${tokens.toJson()}");
    await storage.write(key: SESSION_KEY, value: jsonEncode(tokens.toJson()));
  }

  Future<void> setSession(String accessToken, String refreshToken) async {
    await setSessionModel(
        TokenModel(refreshToken: refreshToken, accessToken: accessToken));
  }

  Future<void> clearSession() async {
    await storage.delete(key: SESSION_KEY);
    debugPrint("$NAME : clear session");
  }
}
