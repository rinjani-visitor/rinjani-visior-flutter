import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/datastate/local_state.dart';
import 'package:rinjani_visitor/features/product/data/source/mock.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';
import 'package:rinjani_visitor/features/product/domain/product_repository.dart';

class ProductRepositoryImpl implements ProductRespository {
  final DataSourceMock remote;

  ProductRepositoryImpl({required this.remote});

  @override
  Future<LocalState<ProductModel>> bookingPackage(
      {required String packageId,
      List<String>? addOns,
      String? paymentMethod}) {
    // TODO: implement bookingPackage
    throw UnimplementedError();
  }

  @override
  Future<void> cancelPackage({required String packageId}) {
    // TODO: implement cancelPackage
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getPackageDetail({required String packageId}) async {
    final result = await remote.getProduct(packageId);
    return result;
  }

  @override
  Future<List<ProductModel>> getPackages(
      {int pages = 1,
      int? itemsPerPage = 10,
      String? category,
      String? avaiability}) async {
    final result = await remote.getProducts(limit: itemsPerPage ?? 10);

    //TODO: remove this when backend is complete
    return result;
  }
}

final productRepositoryProvider = Provider((ref) {
  return ProductRepositoryImpl(remote: DataSourceMock());
});
