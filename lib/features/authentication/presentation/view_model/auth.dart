import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/data/auth_repository_impl.dart';
import 'package:rinjani_visitor/features/authentication/domain/repo/auth_repository.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';

final authViewModelProvider =
    AsyncNotifierProvider<AuthViewModel, AuthEntity?>(() => AuthViewModel());

class AuthViewModel extends AsyncNotifier<AuthEntity?> {
  // ignore: constant_identifier_names
  static const NAME = "AuthRiverpod";
  late final AuthRepository repository;

  @override
  FutureOr<AuthEntity?> build() async {
    repository = ref.read(authRepositoryProvider);
    return await repository.getSavedSession();
  }

  FutureOr<void> logIn(String email, String password) async {
    state = const AsyncLoading();
    developer.log("$NAME : Login emitted");
    state = await AsyncValue.guard(
        () async => await repository.logIn(email: email, password: password));
  }

  FutureOr<void> logOut() async {
    if (state.hasValue && state.value?.refreshToken != null) {
      state = const AsyncLoading();
      developer.log("$NAME : Logout emitted");
      state = await AsyncValue.guard(() async => await repository.logout());
      developer.log("AuthEntity: ${state.asData.toString()}");
    }
  }

  FutureOr<void> register(String username, String email, String country,
      String phone, String password, String password2) async {
    state = const AsyncLoading();
    developer.log("$NAME : Register emitted");
    state = await AsyncValue.guard(() async => await repository.register(
        username: username,
        email: email,
        country: country,
        phone: phone,
        password: password));
    developer.log("value ${state.asData?.value.toString()}");
  }

  FutureOr<void> refresh() async {
    if (state.hasValue && state.value?.refreshToken != null) {
      state = const AsyncLoading();
      developer.log("$NAME : Refresh emitted");
      state = await AsyncValue.guard(
          () async => await repository.refresh(state.value));
      developer.log("AuthEntity: ${state.asData.toString()}");
    }
  }
}
