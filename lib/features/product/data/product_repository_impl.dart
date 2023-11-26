import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/product/data/models/request/toogle_favorite.dart';
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
  Future<List<ProductEntity>> getProducts(
    String token, {
    String? category,
    bool? avaiable,
    int? rating,
    String? query,
  }) async {
    developer.log("Get Product", name: runtimeType.toString());
    try {
      final result = await remote.getProducts(
          token: token,
          title: query?.toString(),
          category: category?.toString(),
          status: avaiable?.toString(),
          rating: rating?.toString());
      final list = result.data!.map((e) => e.toEntity()).toList();
      return list;
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<ProductDetailEntity?> getProductDetail(
    String token, {
    required String productId,
    required String category,
  }) async {
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
  Future<bool?> toggleFavorite(String token, String productId) async {
    developer.log("Add to Favorite", name: runtimeType.toString());
    try {
      final result = await remote.toggleFavourites(
        token: token,
        body: ToggleFavoriteRequest(productId: productId),
      );
      return result.data != null;
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }

  @override
  Future<List<ProductEntity>> getFavorites(String token) {
    try {
      final result = remote.getFavorites(
        token: token,
      );
      return result
          .then((value) => value.data!.map((e) => e.toEntity()).toList());
    } catch (e) {
      throw ExtException.fromDioException(e);
    }
  }
}
