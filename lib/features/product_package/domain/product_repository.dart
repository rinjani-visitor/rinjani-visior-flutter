import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/product_package/domain/product_model.dart';

// TODO: rename this domain to booking
abstract class ProductRespository {
  ///get packages from API with additional query (page, item, category)
  Future<LocalState<List<PackageModel>>> getPackages(
      {int pages = 1,
      int? itemsPerPage = 10,
      String? category,
      String? avaiability});

  /// get package detail, with addons avaiable, etc.
  Future<LocalState<PackageModel>> getPackageDetail(
      {required String packageId});

  /// cancel purchased package.
  /// this method will throw error if current package has already purchased
  Future<void> cancelPackage({required String packageId});

  ///  purchase / booking current package
  Future<LocalState<PackageModel>> bookingPackage(
      {required String packageId, List<String>? addOns, String? paymentMethod});
}
