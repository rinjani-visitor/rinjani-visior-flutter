import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_view_model.g.dart';

@riverpod
class ProductViewModel extends _$ProductViewModel {
  @override
  FutureOr<List<ProductModel>> build() async {
    final repo = ref.read(productRepositoryProvider);
    final packages = await repo.getPackages();
    return packages;
  }

  void sendPayment() {}
}
