import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import '../domain/entity/product.dart';
import '../domain/product_repository.dart';
import 'source/remote.dart';
import 'dart:developer' as developer;

final productRepositoryProvider = Provider((ref) {
  return ProductRepositoryImpl(
      remote: ProductRemoteSource(ref.read(dioServiceProvider)));
});

class ProductRepositoryImpl implements ProductRespository {
  final ProductRemoteSource remote;
  ProductRepositoryImpl({required this.remote});

  @override
  Future<List<ProductEntity>> getProducts(
    String token, {
    String? category,
    bool? avaiable,
    int? rating,
    String? query,
  }) async {
    developer.log("Get Product", name: runtimeType.toString());
    final result = await remote.getProducts(
        token: token,
        title: query?.toString(),
        category: category?.toString(),
        status: avaiable?.toString(),
        rating: rating?.toString());
    final list = result.data?.map((e) => e.toEntity()).toList();
    return list ?? [];
  }

  @override
  Future<ProductDetailEntity?> getProductDetail(
    String token, {
    required String productId,
  }) async {
    developer.log("Get Product Detail", name: runtimeType.toString());
    final data = await remote.getProductDetail(token: token, id: productId);
    developer.log("Get Product Detail Done, ${data.data.title}",
        name: runtimeType.toString());
    final result = data.toEntity();
    return result;
  }
}
