import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

final favoriteListViewModelProvider = AutoDisposeAsyncNotifierProvider<
    FavoriteListViewModel, List<ProductEntity>?>(FavoriteListViewModel.new);

class FavoriteListViewModel
    extends AutoDisposeAsyncNotifier<List<ProductEntity>?> {
  ProductRespository get repository => ref.read(productRepositoryProvider);
  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);

  @override
  FutureOr<List<ProductEntity>?> build() async {
    return await repository.getFavorites(
      authData.state.value!.toAccessTokenAuthorization(),
    );
  }
}
