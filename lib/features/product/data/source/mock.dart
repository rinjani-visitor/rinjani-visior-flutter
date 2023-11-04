import 'package:rinjani_visitor/core/constant/product_package.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';

class DataSourceMock {
  Future<List<ProductModel>> getProducts({int limit = 5}) async {
    final shuffledPackage = mockPackages..shuffle();
    await Future.delayed(Duration(seconds: 3));

    return shuffledPackage.take(limit).toList();
  }

  Future<ProductModel> getProduct(String id) async {
    final result = mockPackages.firstWhere((element) => element.packageId == id,
        orElse: () => mockPackages.first);
    await Future.delayed(Duration(seconds: 3));
    return result;
  }
}
