import 'package:rinjani_visitor/features/product/domain/product_model.dart';

abstract class ProductRespository {
  ///get packages from API with additional query (page, item, category)
  Future<List<ProductModel>> getPackages(
      {int pages = 1,
      int? itemsPerPage = 10,
      String? category,
      String query = "",
      String? avaiability});

  /// get package detail, with addons avaiable, etc.
  Future<ProductModel> getPackageDetail({required String packageId});

  /// cancel purchased package.
  /// this method will throw error if current package has already purchased
  Future<void> cancelPackage({required String packageId});

  ///  purchase / booking current package
  Future<ProductModel> bookingPackage(
      {required String packageId, List<String>? addOns, String? paymentMethod});
}
