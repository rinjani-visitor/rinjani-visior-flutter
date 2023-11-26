import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

abstract class ProductRespository {
  ///get packages from API with additional query (page, item, category)
  Future<List<ProductEntity>> getProducts(String token,
      {String? category, bool? avaiable, int? rating, String? query});

  /// get package detail, with addons avaiable, etc.
  Future<ProductDetailEntity?> getProductDetail(String token,
      {required String productId, required String category});

  /// toggle save current product as favorite
  Future<bool?> toggleFavorite(String token, String productId);

  /// get all favorite product
  Future<List<ProductEntity>> getFavorites(String token);
}
