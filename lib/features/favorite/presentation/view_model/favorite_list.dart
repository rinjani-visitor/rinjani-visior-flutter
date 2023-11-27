import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/favorite/data/favorite_repository_impl.dart';
import 'package:rinjani_visitor/features/favorite/domain/entity/favorite.dart';
import 'package:rinjani_visitor/features/favorite/domain/wishlist_repository.dart';

final favoriteListViewModelProvider = AutoDisposeAsyncNotifierProvider<
    FavoriteListViewModel, List<FavoriteEntity>?>(FavoriteListViewModel.new);

class FavoriteListViewModel
    extends AutoDisposeAsyncNotifier<List<FavoriteEntity>?> {
  FavoriteRepository get repository => ref.read(favoriteRepositoryProvider);
  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);

  @override
  FutureOr<List<FavoriteEntity>?> build() async {
    return await repository.getFavorites(
      authData.state.value!.toAccessTokenAuthorization(),
    );
  }
}
