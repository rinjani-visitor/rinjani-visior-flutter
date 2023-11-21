import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final productDetailViewModelProvider = AsyncNotifierProvider.family<
    ProductDetailViewModel, ProductEntity?, String>(ProductDetailViewModel.new);

class ProductDetailViewModel
    extends FamilyAsyncNotifier<ProductEntity?, String> {
  @override
  FutureOr<ProductEntity?> build(String arg) async {
    final data = await ref
        .read(productRepositoryProvider)
        .getPackageDetail(packageId: arg);
    await Future.delayed(const Duration(seconds: 1));
    return data;
  }
}
