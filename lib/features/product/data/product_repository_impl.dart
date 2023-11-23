import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import '../domain/category_enum.dart';
import '../domain/entity/product.dart';
import '../domain/product_repository.dart';
import 'source/remote.dart';

final productRepositoryProvider = Provider((ref) {
  return ProductRepositoryImpl(
      remote: ProductRemoteSource(ref.read(dioServiceProvider)));
});

class ProductRepositoryImpl implements ProductRespository {
  final ProductRemoteSource remote;
  ProductRepositoryImpl({required this.remote});

  @override
  Future<List<ProductEntity>> getPackages(String token,
      {ProductCategory? category, bool? avaiable, int? rating}) async {
    final result = await remote.getProduct(
        token: token,
        category: category.toString(),
        status: avaiable,
        rating: rating);
    final list = result.data!.map((e) => e.toEntity()).toList();
    return list;
  }

  @override
  Future<ProductDetailEntity> bookingPackage(String token,
      {required String packageId,
      List<String>? addOns,
      String? paymentMethod}) {
    // TODO: implement bookingPackage
    throw UnimplementedError();
  }

  @override
  Future<void> cancelPackage(String token, {required String packageId}) {
    // TODO: implement cancelPackage
    throw UnimplementedError();
  }

  @override
  Future<ProductDetailEntity> getPackageDetail(String token,
      {required String packageId}) {
    // TODO: implement getPackageDetail
    throw UnimplementedError();
  }
}
