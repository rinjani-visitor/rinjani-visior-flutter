import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

final productDetailViewModelProvider = AutoDisposeAsyncNotifierProvider<
    ProductDetailViewModel, ProductDetailEntity?>(ProductDetailViewModel.new);

class ProductDetailViewModel
    extends AutoDisposeAsyncNotifier<ProductDetailEntity?> {
  ProductRespository get repository => ref.read(productRepositoryProvider);
  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);
  @override
  FutureOr<ProductDetailEntity?> build() async {
    return null;
  }

  Future<void> getProductDetail(String category, String productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await repository
        .getProductDetail(authData.getAccessToken()!, productId: productId));
  }
}
