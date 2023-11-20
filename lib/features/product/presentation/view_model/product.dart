import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final productViewModelProvider =
    AsyncNotifierProvider<ProductViewModel, List<ProductEntity>>(
        () => ProductViewModel());

class ProductViewModel extends AsyncNotifier<List<ProductEntity>> {
  @override
  FutureOr<List<ProductEntity>> build() async {
    final repo = ref.read(productRepositoryProvider);
    final packages = await repo.getPackages();
    return packages;
  }

  Future<List<ProductEntity>> getProductByCategory(
      ProductCategory category) async {
    final repo = ref.read(productRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () async => await repo.getPackages(category: category));
    return state.value ?? [];
  }
}
