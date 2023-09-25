import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_usecase.dart';
import 'package:rinjani_visitor/features/secure_storage/presentation/secure_storage_riverpod.dart';

class AuthRiverpod implements AuthUsecase {
  static const JWT_TOKEN = 'jwt_token';

  final FlutterSecureStorage secureStorage;
  AuthRiverpod(this.secureStorage);

  static final provider = Provider<AuthRiverpod>((ref) {
    final secureStorage = ref.read(secureStorageProvider);
    return AuthRiverpod(secureStorage);
  });

  @override
  Future<String> getToken() async {
    // TODO: keep this function until API specs is provided
    // Simulate get token behaviour when get data from API
    return Future.delayed(
      const Duration(seconds: 3),
      () => "",
    );
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

  @override
  void loginWithGoogle() {
    // TODO: implement loginWithGoogle
  }
}
