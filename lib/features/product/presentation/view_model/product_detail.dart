import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final productDetailViewModelProvider = AutoDisposeAsyncNotifierProvider<
    ProductDetailViewModel, ProductDetailEntity?>(ProductDetailViewModel.new);

class ProductDetailViewModel
    extends AutoDisposeAsyncNotifier<ProductDetailEntity?> {
  @override
  FutureOr<ProductDetailEntity?> build() async {
    return null;
  }

  Future<void> getProductDetail(String category, String productId) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async => await ref
        .read(productRepositoryProvider)
        .getProductDetail(
            ref.read(authViewModelProvider).value!.toAccessTokenAuthorization(),
            category: category,
            productId: productId));
  }
}
