import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

final favoriteViewModelProvider =
    AsyncNotifierProvider<FavoriteViewModel, List<ProductEntity>>(
        FavoriteViewModel.new);

class FavoriteViewModel extends AsyncNotifier<List<ProductEntity>> {
  ProductRespository get repository => ref.read(productRepositoryProvider);
  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);

  @override
  FutureOr<List<ProductEntity>> build() async {
    return await repository.getFavorites(
        authData.state.value!.toAccessTokenAuthorization(),
        authData.state.value!.userId!);
  }

  FutureOr<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await repository.getFavorites(
          authData.state.value!.toAccessTokenAuthorization(),
          authData.state.value!.userId!);
    });
  }

  Future<bool> addToFavorite(String productId) async {
    try {
      await repository.addToFavorite(
          ref.read(authViewModelProvider).value!.toAccessTokenAuthorization(),
          productId);
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }

  Future<bool> removeFromFavorite(String productId) async {
    try {
      await repository.removeFromFavorite(
          authData.state.value!.toAccessTokenAuthorization(), productId);
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }
}
