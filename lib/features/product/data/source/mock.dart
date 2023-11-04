


import 'package:rinjani_visitor/core/constant/product_package.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';

class DataSourceMock {
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(Duration(seconds: 3));
    return mockPackages;
  }
  Future<ProductModel> getProduct(String id) async {
    final result = mockPackages.where((element) => element.packageId == id).toList();
    await Future.delayed(Duration(seconds: 3));
    return result[0];
  }
}