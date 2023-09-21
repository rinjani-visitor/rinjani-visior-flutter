abstract class AuthUsecase {
  void logIn(String email, String password);
  void register(String email, String password, String password2);
  void logout();
}
