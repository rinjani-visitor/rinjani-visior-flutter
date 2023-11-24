import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final productCategoryViewModelProvider =
    AutoDisposeAsyncNotifierProvider.family<ProductCategoryViewModel,
        List<ProductEntity>, ProductCategory>(ProductCategoryViewModel.new);

class ProductCategoryViewModel extends AutoDisposeFamilyAsyncNotifier<
    List<ProductEntity>, ProductCategory> {
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
  FutureOr<List<ProductEntity>> build(ProductCategory arg) async {
    final repo = ref.read(productRepositoryProvider);
    final data = await repo.getProducts(
        ref.read(authViewModelProvider).value!.toAccessTokenAuthorization(),
        category: _fromEnum(arg));
    return data;
  }
}
