import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final productCategoryViewModelProvider = AutoDisposeFamilyAsyncNotifierProvider<
    ProductCategoryViewModel,
    List<ProductEntity>,
    ProductCategory>(ProductCategoryViewModel.new);

class ProductCategoryViewModel extends AutoDisposeFamilyAsyncNotifier<
    List<ProductEntity>, ProductCategory> {
  @override
  FutureOr<List<ProductEntity>> build(ProductCategory arg) async {
    final repo = ref.read(productRepositoryProvider);
    final data = await repo.getPackages(category: arg);
    return data;
  }
}
