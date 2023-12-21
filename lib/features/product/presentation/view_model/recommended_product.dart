import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

final recommendedProductViewModelProvider =
    AsyncNotifierProvider<RecommendedProductViewModel, List<ProductEntity>>(
        () => RecommendedProductViewModel());

class RecommendedProductViewModel extends AsyncNotifier<List<ProductEntity>> {
  ProductRespository get repository => ref.read(productRepositoryProvider);
  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);

  Future<List<ProductEntity>> get _getProducts async =>
      await repository.getProducts(authData.getAccessToken()!, category: "rinjani");
  @override
  FutureOr<List<ProductEntity>> build() async {
    final packages = await _getProducts;
    developer.log("packages: $packages", name: runtimeType.toString());
    return packages;
  }

  void refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _getProducts);
  }
}
