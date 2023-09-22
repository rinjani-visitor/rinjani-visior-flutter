import 'package:rinjani_visitor/features/authentication/domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final String dataSource;

  AuthRepositoryImpl({required this.dataSource});
  @override
  Future<void> logIn(String email, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(String email, String password, String password2) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
