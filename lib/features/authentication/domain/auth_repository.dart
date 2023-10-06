abstract class AuthRepository {
  Future<void> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password}) async {}

  Future<void> logIn({required String email, required String password}) async {}

  Future<void> logout();
}
