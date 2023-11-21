import 'package:rinjani_visitor/core/constant/product_package.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

class MockRemoteSource {
  Future<List<ProductEntity>> refresh(String val) async {
    await Future.delayed(Duration(seconds: 1));
    return mockPackages
        .where((element) => element.title.contains(val))
        .toList();
  }
}
