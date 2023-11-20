import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final recommendedProductRiverpodProvider =
    AsyncNotifierProviderImpl<RecommendedProductRiverpod, List<ProductEntity>>(
        () => RecommendedProductRiverpod());

class RecommendedProductRiverpod extends AsyncNotifier<List<ProductEntity>> {
  @override
  FutureOr<List<ProductEntity>> build() async {
    final repo = ref.read(productRepositoryProvider);
    final packages = await repo.getPackages(itemsPerPage: 4);
    return packages;
  }
}
