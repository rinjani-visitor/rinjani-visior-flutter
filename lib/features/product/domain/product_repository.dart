import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

abstract class ProductRespository {
  ///get packages from API with additional query (page, item, category)
  Future<List<ProductEntity>> getProducts(String token,
      {String? category, bool? avaiable, int? rating, String? query});

  /// get package detail, with addons avaiable, etc.
  Future<ProductDetailEntity?> getProductDetail(String token,
      {required String productId});
}
