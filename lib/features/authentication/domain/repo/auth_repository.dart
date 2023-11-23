import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';

abstract class AuthRepository {
  Future<AuthEntity?> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password});

  Future<AuthEntity?> logIn({required String email, required String password});

  Future<AuthEntity?> logout();
  Future<AuthEntity?> getSavedSession();
  Future<AuthEntity> refresh(AuthEntity? authEntity);
}
