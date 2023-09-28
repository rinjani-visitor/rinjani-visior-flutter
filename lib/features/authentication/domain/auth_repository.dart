import 'package:rinjani_visitor/core/datastate/local_state.dart';

abstract class AuthRepository {
  Stream<LocalState<String>> logIn(String email, String password);
  Stream<LocalState<String>> register(
      String email, String password, String password2);

  ////////
  Future<LocalState<String>> logout();
  ///////
  Future<LocalState<String>> saveSession(String token);
  Future<LocalState<String>> clearSession();
  Future<LocalState<String>> checkSession();
  Future<LocalState<String>> refreshSession();
}
