import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final productViewModelProvider =
    AutoDisposeAsyncNotifierProvider<ProductViewModel, List<ProductEntity>>(
        () => ProductViewModel());

class ProductViewModel extends AutoDisposeAsyncNotifier<List<ProductEntity>> {
  @override
  FutureOr<List<ProductEntity>> build() async {
    final repo = ref.read(productRepositoryProvider);
    final packages = await repo.getProducts(
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization());
    return packages;
  }
}
