import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/features/authentication/data/auth_repository_impl.dart';
import 'package:rinjani_visitor/features/authentication/domain/repo/auth_repository.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_riverpod.g.dart';

@Riverpod(keepAlive: true)
class AuthRiverpod extends _$AuthRiverpod {
  // ignore: constant_identifier_names
  static const NAME = "AuthRiverpod";
  late final AuthRepository repository;

  @override
  FutureOr<Auth?> build() async {
    repository = ref.read(authRepositoryProvider);
    return await repository.getSavedSession();
  }

  FutureOr<void> logIn(String email, String password) async {
    state = const AsyncLoading();
    debugPrint("$NAME : Login emitted");
    state = await AsyncValue.guard(
        () async => await repository.logIn(email: email, password: password));
  }

  FutureOr<void> logOut() async {
    if (state.hasValue && state.value?.token != null) {
      state = const AsyncLoading();
      debugPrint("$NAME : Logout emitted");
      state = await AsyncValue.guard(() async => await repository.logout());
      debugPrint("AuthEntity: ${state.asData.toString()}");
    }
  }

  FutureOr<void> register(String username, String email, String country,
      String phone, String password, String password2) async {
    state = const AsyncLoading();
    debugPrint("$NAME : Register emitted");
    state = await AsyncValue.guard(() async => await repository.register(
        username: username,
        email: email,
        country: country,
        phone: phone,
        password: password));
    debugPrint("value ${state.asData?.value.toString()}");
  }
}
