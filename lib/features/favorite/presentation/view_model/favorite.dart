import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/favorite/data/favorite_repository_impl.dart';
import 'package:rinjani_visitor/features/favorite/domain/wishlist_repository.dart';

final favoriteViewModelProvider =
    AutoDisposeAsyncNotifierProvider<FavoriteViewModel, bool?>(
        FavoriteViewModel.new);

class FavoriteViewModel extends AutoDisposeAsyncNotifier<bool?> {
  FavoriteRepository get repository => ref.read(favoriteRepositoryProvider);
  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);

  @override
  FutureOr<bool?> build() async {
    return null;
  }

  FutureOr<void> toggleFavorite(String productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await repository.toggleFavorite(
        authData.state.value!.toAccessTokenAuthorization(),
        productId,
      );
    });
  }
}
