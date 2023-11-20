import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:rinjani_visitor/features/authentication/data/auth_repository_impl.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';

import 'auth_test.mocks.dart';

ProviderContainer _makeProviderContainer(
    MockAuthRepositoryImpl authRepository) {
  final container = ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(authRepository),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

@GenerateMocks([AuthRepositoryImpl])
void main() {
  late MockAuthRepositoryImpl authRepository;
  late ProviderContainer container;

  setUpAll(() {
    authRepository = MockAuthRepositoryImpl();
    container = _makeProviderContainer(authRepository);
  });

  group("authViewModel Test", () {
    test("init should return null", () async {
      when(authRepository.getSavedSession())
          .thenAnswer((_) async => Future.value(null));
      await expectLater(
          container.read(authViewModelProvider.future), completion(isNull));
    });
    test(
        "login should return auth data, authRepository.logIn function should called 1 time",
        () async {
      final expectAuthData = Auth(token: "token");
      final controller = container.read(authViewModelProvider.notifier);
      when(authRepository.logIn(email: "", password: ""))
          .thenAnswer((_) => Future.value(expectAuthData));

      await controller.logIn("", "");

      expect(container.read(authViewModelProvider).value, expectAuthData);
      verify(authRepository.logIn(email: "", password: "")).called(1);
    });
    test(
        "Register should return auth data, authRepository.register function should called 1 time",
        () async {
      final expectAuthData = Auth();

      final controller = container.read(authViewModelProvider.notifier);

      when(authRepository.register(
              country: "", email: "", password: "", phone: "", username: ""))
          .thenAnswer((_) => Future.value(expectAuthData));
      await controller.register("", "", "", "", "", "");

      expect(container.read(authViewModelProvider).value, expectAuthData);
      verify(authRepository.register(
              country: "", email: "", password: "", phone: "", username: ""))
          .called(1);
    });
  });
}
