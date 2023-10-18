import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/features/authentication/data/auth_repsitory_impl.dart';
import 'package:rinjani_visitor/features/authentication/domain/auth_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_riverpod.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  late final AuthRepositoryImpl repository;

  @override
  FutureOr<AuthModel> build() async {
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
      state = const AsyncData(AuthModel());
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

  Future<String> getToken() async {
    await Future.delayed(const Duration(seconds: 3));
    debugPrint("current token: ${state.asData?.value.token}");
    return state.asData?.value.token ?? "";
  }

  // Future<AuthModel> getSession() async {
  //   await Future.delayed(const Duration(seconds: 3));
  // }
}
