import 'package:flutter/foundation.dart';
import 'package:rinjani_visitor/core/constant/product_package.dart';
import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_riverpod.g.dart';

@Riverpod(keepAlive: true)
class SearchRiverpod extends _$SearchRiverpod {
  @override
  FutureOr<List<ProductModel>> build() async {
    final data =
        await ref.read(productRepositoryProvider).getPackages(itemsPerPage: 40);
    debugPrint("Search Data: ${data.length}");
    return data;
  }

  FutureOr<void> searchPackage(String name) {
    debugPrint("Search Data: ${name}");
    state = AsyncData(mockPackages
        .where((element) =>
            element.title.toLowerCase().contains(name.toLowerCase()))
        .toList());
  }

  List<ProductModel> getProductByCategory(ProductCategory category) {
    if (state.asData == null) return [];
    final products = state.asData!.value;
    return products.where((element) => element.category == category).toList();
  }
}
