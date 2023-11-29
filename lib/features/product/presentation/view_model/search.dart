import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

final productSearchViewModelProvider =
    AsyncNotifierProvider<ProductSearchViewModel, List<ProductEntity>>(
        () => ProductSearchViewModel());

class ProductSearchViewModel extends AsyncNotifier<List<ProductEntity>> {
  ProductRespository get repository => ref.read(productRepositoryProvider);
  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);

  @override
  FutureOr<List<ProductEntity>> build() async {
    final data = await repository.getProducts(authData.getAccessToken()!);
    debugPrint("Search Data: ${data.length}");
    return data;
  }

  FutureOr<void> searchPackage(String name) async {
    debugPrint("Search Data: $name");
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async => await repository.getProducts(
        authData.state.value!.toAccessTokenAuthorization(),
        query: name));
  }
}
