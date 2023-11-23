import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final recommendedProductViewModelProvider =
    AsyncNotifierProvider<RecommendedProductViewModel, List<ProductEntity>>(
        () => RecommendedProductViewModel());

class RecommendedProductViewModel extends AsyncNotifier<List<ProductEntity>> {
  Future<List<ProductEntity>> get _getProducts async =>
      await ref.read(productRepositoryProvider).getProducts(
          ref.read(authViewModelProvider).value!.toAccessTokenAuthorization());
  @override
  FutureOr<List<ProductEntity>> build() async {
    final packages = await _getProducts;
    return packages;
  }

  void refresh() async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _getProducts);
  }
}
