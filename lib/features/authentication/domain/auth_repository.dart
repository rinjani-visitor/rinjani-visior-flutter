import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password});

  Future<AuthModel> logIn({required String email, required String password});

  Future<void> logout();
  Future<AuthModel?> getSavedSession();
}
