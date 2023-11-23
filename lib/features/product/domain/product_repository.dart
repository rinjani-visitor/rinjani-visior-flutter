import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

abstract class ProductRespository {
  ///get packages from API with additional query (page, item, category)
  Future<List<ProductEntity>> getProducts(String token,
      {ProductCategory? category, bool? avaiable, int? rating});

  /// get package detail, with addons avaiable, etc.
  Future<ProductDetailEntity> getPackageDetail(String token,
      {required String packageId});

  /// cancel purchased package.
  /// this method will throw error if current package has already purchased
  Future<void> cancelPackage(String token, {required String packageId});

  ///  purchase / booking current package
  Future<ProductDetailEntity> bookingPackage(String token,
      {required String packageId, List<String>? addOns, String? paymentMethod});
}
