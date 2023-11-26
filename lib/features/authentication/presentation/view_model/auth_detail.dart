import 'dart:async';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/features/authentication/data/repo.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth_detail.dart';
import 'package:rinjani_visitor/features/authentication/domain/repo/auth_repository.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';

final authDetailViewModelProvider =
    AutoDisposeAsyncNotifierProvider<AuthDetailViewModel, AuthDetailEntity?>(
        AuthDetailViewModel.new);

class AuthDetailViewModel extends AutoDisposeAsyncNotifier<AuthDetailEntity?> {
  AuthRepository get authRepository => ref.read(authRepositoryProvider);
  AuthViewModel get authViewModel => ref.read(authViewModelProvider.notifier);
  @override
  FutureOr<AuthDetailEntity?> build() async {
    final id = authViewModel.state.value!.userId;
    final token = authViewModel.state.value!.toAccessTokenAuthorization();
    final data = await authRepository.getUserDetail(token, id!);
    return data;
  }

  FutureOr<void> refresh() async {
    state = const AsyncLoading();
    final id = authViewModel.state.value!.userId;
    final token = authViewModel.state.value!.toAccessTokenAuthorization();
    state = await AsyncValue.guard(
        () async => await authRepository.getUserDetail(token, id!));
  }

  Future<void> uploadAvatar(File? file) async {
    if (file == null) return;
    final id = authViewModel.state.value!.userId;
    final token = authViewModel.state.value!.toAccessTokenAuthorization();
    try {
      final data = await authRepository.uploadAvatar(token, id!, file);
      developer.log("upload status ${data.toString()}",
          name: runtimeType.toString());
      if (data == true) {
        refresh();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
