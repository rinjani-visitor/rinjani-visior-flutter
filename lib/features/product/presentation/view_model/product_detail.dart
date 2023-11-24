import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final productDetailViewModelProvider = AutoDisposeAsyncNotifierProvider.family<
    ProductDetailViewModel,
    ProductDetailEntity?,
    List<String>>(ProductDetailViewModel.new);

class ProductDetailViewModel
    extends AutoDisposeFamilyAsyncNotifier<ProductDetailEntity?, List<String>> {
  @override
  FutureOr<ProductDetailEntity?> build(List<String> arg) async {
    final data = await ref.read(productRepositoryProvider).getPackageDetail(
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization(),
        category: arg[0],
        productId: arg[1]);
    await Future.delayed(const Duration(seconds: 1));
    return data;
  }
}
