import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/features/authentication/data/auth_repository_impl.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_riverpod.g.dart';

@Riverpod(keepAlive: true)
class AuthRiverpod extends _$AuthRiverpod {
  late final AuthRepository repository;

  @override
  FutureOr<AuthModel?> build() async {
    final repo = ref.read(AuthRepositoryImpl.provider);
    repository = repo;
    return await repository.getSavedSession();
  }

  FutureOr<void> logIn(String email, String password) async {
    state = const AsyncLoading();
    debugPrint("Login emitted");
    state = await AsyncValue.guard(
        () async => await repository.logIn(email: email, password: password));
  }

  FutureOr<void> logOut() async {
    if (state.hasValue && state.value?.token != null) {
      state = const AsyncValue.loading();
      await repository.logout();
      state = const AsyncData(null);
      debugPrint("AuthViewModel: ${state.asData.toString()}");
    }
  }

  FutureOr<void> register(String username, String email, String country,
      String phone, String password, String password2) async {
    state = const AsyncValue.loading();
    debugPrint("Register emitted");

    state = await AsyncValue.guard(() async => await repository.register(
        username: username,
        email: email,
        country: country,
        phone: phone,
        password: password));
    debugPrint("value ${state.asData?.value.toString()}");
  }
}
