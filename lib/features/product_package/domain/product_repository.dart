import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/product_package/domain/package_model.dart';

abstract class ProductRespository {
  Future<LocalState<List<PackageModel>>> getPackages();
  Future<LocalState<PackageModel>> getPackageDetail();
  Future<LocalState<PackageModel>> bookPackage();
}
