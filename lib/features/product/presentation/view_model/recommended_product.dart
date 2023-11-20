import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final recommendedProductViewModelProvider =
    AsyncNotifierProvider<RecommendedProductViewModel, List<ProductEntity>>(
        () => RecommendedProductViewModel());

class RecommendedProductViewModel extends AsyncNotifier<List<ProductEntity>> {
  @override
  FutureOr<List<ProductEntity>> build() async {
    final repo = ref.read(productRepositoryProvider);
    final packages = await repo.getPackages(itemsPerPage: 4);
    return packages;
  }
}
