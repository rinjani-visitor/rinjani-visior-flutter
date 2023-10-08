import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';

abstract class AuthRepository {
  Future<LocalState<AuthModel>> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password});

  Future<LocalState<AuthModel>> logIn(
      {required String email, required String password});

  Future<void> logout();
}
