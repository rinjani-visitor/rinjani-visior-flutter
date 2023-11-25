import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

abstract class ProductRespository {
  ///get packages from API with additional query (page, item, category)
  Future<List<ProductEntity>> getProducts(String token,
      {String? category, bool? avaiable, int? rating, String? query});

  /// get package detail, with addons avaiable, etc.
  Future<ProductDetailEntity?> getProductDetail(String token,
      {required String productId, required String category});

  /// cancel purchased package.
  /// this method will throw error if current package has already purchased
  Future<void> cancelPackage(String token, {required String packageId});

  ///  purchase / booking current package
  Future<ProductDetailEntity?> bookingPackage(String token,
      {required String packageId, List<String>? addOns, String? paymentMethod});
}
