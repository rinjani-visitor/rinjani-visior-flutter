import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final productRiverpodProvider = AsyncNotifierProviderImpl<ProductRiverpod, List<ProductEntity>>(() => ProductRiverpod());

class ProductRiverpod extends AsyncNotifier<List<ProductEntity>> {
  @override
  FutureOr<List<ProductEntity>> build() async {
    final repo = ref.read(productRepositoryProvider);
    final packages = await repo.getPackages();
    return packages;
  }

  List<ProductEntity> getProductByCategory(ProductCategory category) {
    final products = state.asData!.value;
    return products.where((element) => element.category == category).toList();
  }

  void sendPayment() {}
}
