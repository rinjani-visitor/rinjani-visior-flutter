import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

final productCategoryViewModelProvider = AutoDisposeAsyncNotifierProvider<
    ProductCategoryViewModel,
    List<ProductEntity>?>(ProductCategoryViewModel.new);

class ProductCategoryViewModel
    extends AutoDisposeAsyncNotifier<List<ProductEntity>?> {
  ProductRespository get repository => ref.read(productRepositoryProvider);
  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);
  @override
  FutureOr<List<ProductEntity>?> build() async {
    return null;
  }

  FutureOr<void> getProductCategory(String category) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await repository.getProducts(
        authData.state.value!.toAccessTokenAuthorization(),
        category: category));
  }
}
