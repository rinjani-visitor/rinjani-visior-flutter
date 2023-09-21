import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_usecase.dart';
import 'package:rinjani_visitor/features/secure_storage/presentation/secure_storage_riverpod.dart';

class AuthenticationNotifier extends ChangeNotifier implements AuthUsecase {
  static const JWT_TOKEN = 'jwt_token';

  final FlutterSecureStorage secureStorage;
  AuthenticationNotifier(this.secureStorage);

  Future<String> getToken() async {
    return await secureStorage.read(key: JWT_TOKEN) ?? "";
  }

  @override
  void logout() {
    // TODO: implement logout
  }

  @override
  void logIn(String email, String password) {
    // TODO: implement logIn
  }

  @override
  void register(String email, String password, String password2) {
    // TODO: implement register
  }
}

final authenticationProvider =
    ChangeNotifierProvider<AuthenticationNotifier>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return AuthenticationNotifier(secureStorage);
});
