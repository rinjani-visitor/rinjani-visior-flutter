import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recommended_product_riverpod.g.dart';

@Riverpod()
class RecommendedProductRiverpod extends _$RecommendedProductRiverpod {
  @override
  FutureOr<List<ProductModel>> build() async {
    final repo = ref.read(productRepositoryProvider);
    final packages = await repo.getPackages(itemsPerPage: 4);
    return packages;
  }
}
