import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import '../domain/category_enum.dart';
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
  Future<List<ProductEntity>> getProducts(String token,
      {String? category, bool? avaiable, int? rating, String? query}) async {
    try {
      developer.log("Get Product", name: runtimeType.toString());
      final result = await remote.getProducts(
          token: token,
          query: query?.toString(),
          category: category?.toString(),
          status: avaiable?.toString(),
          rating: rating?.toString());
      developer.log("Get Product Done", name: runtimeType.toString());
      final list = result.data!.map((e) => e.toEntity()).toList();
      return list;
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<ProductDetailEntity?> getProductDetail(String token,
      {required String productId, required String category}) async {
    developer.log("Get Product Detail, $category $productId",
        name: runtimeType.toString());
    try {
      final data = await remote.getProductDetail(
          token: token, category: category, id: productId);
      developer.log("Get Product Detail Done, ${data.data.title}",
          name: runtimeType.toString());
      final result = data.toEntity();
      return result;
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<ProductDetailEntity?> bookingPackage(String token,
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
}
