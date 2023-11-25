import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/data/repo.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth_detail.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';

final authDetailViewModelProvider =
    AutoDisposeAsyncNotifierProvider<AuthDetailViewModel, AuthDetailEntity?>(
        AuthDetailViewModel.new);

class AuthDetailViewModel extends AutoDisposeAsyncNotifier<AuthDetailEntity?> {
  @override
  FutureOr<AuthDetailEntity?> build() async {
    final id = ref.read(authViewModelProvider).value!.userId;

    final token =
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization();
    final data =
        await ref.read(authRepositoryProvider).getUserDetail(token, id!);
    return data;
  }

  FutureOr<void> refresh() async {
    state = const AsyncLoading();
    final id = ref.read(authViewModelProvider).value!.userId;
    final token =
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization();
    state = await AsyncValue.guard(() async =>
        await ref.read(authRepositoryProvider).getUserDetail(token, id!));
  }
}
