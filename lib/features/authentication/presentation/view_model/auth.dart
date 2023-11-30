import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/data/repository_impl.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';
import 'package:rinjani_visitor/features/authentication/domain/repo/auth.dart';

final authViewModelProvider =
    AsyncNotifierProvider<AuthViewModel, AuthEntity?>(() => AuthViewModel());

class AuthViewModel extends AsyncNotifier<AuthEntity?> {
  // ignore: constant_identifier_names
  static const NAME = "AuthRiverpod";
  AuthRepository get repository => ref.read(authRepositoryProvider);

  @override
  FutureOr<AuthEntity?> build() async {
    final authEntity = await repository.getSavedSession();
    developer.log("auth entity: ${authEntity.toString()}");
    if (authEntity == null) {
      return null;
    }
    final data = await repository.refresh(authEntity);
    return data;
  }

  FutureOr<void> refresh() async {
    state = const AsyncLoading();
    developer.log("$NAME : Refresh emitted");
    state = await AsyncValue.guard(() async {
      final data = await repository.refresh(state.value!);
      return data;
    });
    developer.log("AuthEntity: ${state.asData.toString()}");
    if (state.hasError) {
      state = const AsyncData(null);
    }
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

  Future<String?> resetPassword(String email) async {
    final temp = state;
    state = const AsyncLoading();
    developer.log("$NAME : Reset Password emitted");
    try {
      final data = await repository.resetPassword(email: email);
      state = temp;
      return data;
    } catch (e) {
      developer.log("error: ${e.toString()}");
      state = temp;
      return e.toString();
    }
  }

  /// get access token from authViewModel for any provider that can't access
  /// into [AsyncValue] state data
  ///
  /// this function with return "Bearer accessToken" if token exist
  String? getAccessToken() {
    return state.value?.toAccessTokenAuthorization();
  }

  String? getRefreshToken() {
    return state.value?.toRefreshTokenAuthorization();
  }
}
