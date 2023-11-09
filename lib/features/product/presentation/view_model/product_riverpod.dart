import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_riverpod.g.dart';

@riverpod
class ProductRiverpod extends _$ProductRiverpod {
  @override
  FutureOr<List<ProductModel>> build() async {
    final repo = ref.read(productRepositoryProvider);
    final packages = await repo.getPackages();
    return packages;
  }

  List<ProductModel> getProductByCategory(ProductCategory category) {
    final products = state.asData!.value;
    return products.where((element) => element.category == category).toList();
  }

  void sendPayment() {}
}
