import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';

abstract class AuthRepository {
  Future<void> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password}) async {}

  Future<LocalState<AuthModel>> logIn(
      {required String email, required String password});

  Future<void> logout();
}
