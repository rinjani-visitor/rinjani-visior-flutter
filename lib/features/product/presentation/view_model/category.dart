import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final productCategoryViewModelProvider = AutoDisposeAsyncNotifierProvider<
    ProductCategoryViewModel,
    List<ProductEntity>?>(ProductCategoryViewModel.new);

class ProductCategoryViewModel
    extends AutoDisposeAsyncNotifier<List<ProductEntity>?> {
  String? _fromEnum(ProductCategory category) {
    switch (category) {
      case ProductCategory.rinjani:
        return "rinjani";
      case ProductCategory.culture:
        return "culture";
      case ProductCategory.homeStay:
        return "home_stay";
      case ProductCategory.landscape:
        return "landscape";
      default:
        return null;
    }
  }

  @override
  FutureOr<List<ProductEntity>?> build() async {
    return null;
  }

  FutureOr<void> getProductCategory(String category) async {
    state = const AsyncLoading();
    final repo = ref.read(productRepositoryProvider);
    state = await AsyncValue.guard(() async => await repo.getProducts(
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization(),
        category: category));
  }
}
