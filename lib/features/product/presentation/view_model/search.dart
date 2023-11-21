import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

final productSearchViewModelProvider =
    AsyncNotifierProvider<ProductSearchViewModel, List<ProductEntity>>(
        () => ProductSearchViewModel());

class ProductSearchViewModel extends AsyncNotifier<List<ProductEntity>> {
  late final ProductRespository productRepository;

  @override
  FutureOr<List<ProductEntity>> build() async {
    productRepository = ref.read(productRepositoryProvider);
    final data = await productRepository.getPackages(itemsPerPage: 40);
    debugPrint("Search Data: ${data.length}");
    return data;
  }

  FutureOr<void> searchPackage(String name) async {
    debugPrint("Search Data: $name");
    state = const AsyncLoading();

    state = await AsyncValue.guard(
        () async => await productRepository.getPackages(query: name));
  }
}
