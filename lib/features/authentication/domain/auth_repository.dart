import 'package:rinjani_visitor/core/datastate/local_state.dart';

abstract class AuthRepository {
  Future<LocalState> logIn(String email, String password);
  Future<LocalState> register(String email, String password, String password2);
  Future<LocalState> logout();
  Future<String> getToken();
}
