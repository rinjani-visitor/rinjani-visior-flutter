import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final productDetailViewModelProvider = AutoDisposeAsyncNotifierProvider.family<
    ProductDetailViewModel,
    ProductDetailEntity?,
    String>(ProductDetailViewModel.new);

class ProductDetailViewModel
    extends AutoDisposeFamilyAsyncNotifier<ProductDetailEntity?, String> {
  @override
  FutureOr<ProductDetailEntity?> build(String arg) async {
    final data = await ref.read(productRepositoryProvider).getPackageDetail(
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization(),
        packageId: arg);
    await Future.delayed(const Duration(seconds: 1));
    return data;
  }
}
