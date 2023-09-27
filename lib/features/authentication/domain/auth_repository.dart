import 'package:rinjani_visitor/core/datastate/local_state.dart';

abstract class AuthRepository {
  Future<LocalState<String>> logIn(String email, String password);
  Future<String> register(String email, String password, String password2);
  Future<String> logout();
  Future<String> getToken();
}
