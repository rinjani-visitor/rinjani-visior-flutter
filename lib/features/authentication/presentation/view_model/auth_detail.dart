import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/features/authentication/data/repository_impl.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth_detail.dart';
import 'package:rinjani_visitor/features/authentication/domain/repo/auth.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';

final authDetailViewModelProvider =
    AutoDisposeAsyncNotifierProvider<AuthDetailViewModel, AuthDetailEntity?>(
        AuthDetailViewModel.new);

class AuthDetailViewModel extends AutoDisposeAsyncNotifier<AuthDetailEntity?> {
  AuthRepository get authRepository => ref.read(authRepositoryProvider);
  AuthViewModel get authViewModel => ref.read(authViewModelProvider.notifier);
  @override
  FutureOr<AuthDetailEntity?> build() async {
    final token = authViewModel.state.value!.toAccessTokenAuthorization();
    final userId = authViewModel.state.value!.userId!;

    final data = await authRepository.getUserDetail(token, userId);
    return data;
  }

  FutureOr<void> refresh() async {
    state = const AsyncLoading();
    final token = authViewModel.state.value!.toAccessTokenAuthorization();
    final userId = authViewModel.state.value!.userId!;
    state = await AsyncValue.guard(
        () async => await authRepository.getUserDetail(token, userId));
  }

  Future<void> uploadAvatar(File? file) async {
    if (file == null) return;
    final token = authViewModel.state.value!.toAccessTokenAuthorization();
    try {
      final data = await authRepository.uploadAvatar(token, file);
      developer.log("upload status ${data.toString()}",
          name: runtimeType.toString());
      if (data == true) {
        refresh();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> updateUserDetail(
      {String? name,
      String? phoneNumber,
      String? country,
      String? password,
      String? confirmPassword}) async {
    state = const AsyncLoading();
    final token = authViewModel.state.value!.toAccessTokenAuthorization();
    final userId = authViewModel.state.value!.userId!;
    try {
      await authRepository.updateUserDetail(
        token,
        userId,
        phoneNumber:
            phoneNumber != null && phoneNumber.isNotEmpty ? phoneNumber : null,
        name: name != null && name.isNotEmpty ? name : null,
        password: password != null && password.isNotEmpty ? password : null,
        confirmPassword: confirmPassword != null && confirmPassword.isNotEmpty
            ? confirmPassword
            : null,
        country: country != null && country.isNotEmpty ? country : null,
      );
      Fluttertoast.showToast(msg: "Update success");
      refresh();
      return;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      refresh();
    }
  }
}
