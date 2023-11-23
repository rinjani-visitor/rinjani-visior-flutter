import 'package:rinjani_visitor/core/constant/product_package.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

class DataSourceMock {
  Future<List<ProductDetailEntity>> getProducts(
      {int limit = 5, String query = ""}) async {
    final filteredPackage = query.isNotEmpty
        ? mockPackages.where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        : mockPackages;
    await Future.delayed(const Duration(seconds: 1));
    return filteredPackage.take(limit).toList();
  }

  Future<ProductDetailEntity> getProduct(String id) async {
    final result = mockPackages.firstWhere((element) => element.packageId == id,
        orElse: () => mockPackages.first);
    await Future.delayed(const Duration(seconds: 1));
    return result;
  }
}
