import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final productDetailViewModelProvider =
    AsyncNotifierProvider<ProductDetailViewModel, ProductEntity?>(
        () => ProductDetailViewModel());

class ProductDetailViewModel extends AsyncNotifier<ProductEntity?> {
  @override
  FutureOr<ProductEntity?> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return null;
  }
}
