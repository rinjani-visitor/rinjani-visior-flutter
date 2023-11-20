import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

abstract class ProductRespository {
  ///get packages from API with additional query (page, item, category)
  Future<List<ProductEntity>> getPackages(
      {int pages = 1,
      int? itemsPerPage = 10,
      String? category,
      String query = "",
      String? avaiability});

  /// get package detail, with addons avaiable, etc.
  Future<ProductEntity> getPackageDetail({required String packageId});

  /// cancel purchased package.
  /// this method will throw error if current package has already purchased
  Future<void> cancelPackage({required String packageId});

  ///  purchase / booking current package
  Future<ProductEntity> bookingPackage(
      {required String packageId, List<String>? addOns, String? paymentMethod});
}
