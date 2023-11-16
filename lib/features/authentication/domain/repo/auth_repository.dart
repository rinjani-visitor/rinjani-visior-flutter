import 'package:rinjani_visitor/features/authentication/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<Auth> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password});

  Future<Auth> logIn({required String email, required String password});

  Future<Auth?> logout();
  Future<Auth?> getSavedSession();
}
