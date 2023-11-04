import 'package:rinjani_visitor/features/product/data/product_repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_view_model.g.dart';

@Riverpod()
class SearchViewModel extends _$SearchViewModel {
  @override
  FutureOr<List<ProductModel>> build() async {
    final data =
        await ref.read(productRepositoryProvider).getPackages(itemsPerPage: 20);
    return data;
  }
}
