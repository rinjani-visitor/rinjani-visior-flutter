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

  List<ProductEntity> getProductByCategory(ProductCategory category) {
    final products = state.asData!.value;
    return products.where((element) => element.category == category).toList();
  }

  void sendPayment() {}
}
