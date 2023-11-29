import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/exception/exception.dart';
import 'package:rinjani_visitor/core/presentation/services/dio_service.dart';
import 'package:rinjani_visitor/features/favorite/data/models/request/request.dart';
import 'package:rinjani_visitor/features/favorite/data/source/remote.dart';
import 'package:rinjani_visitor/features/favorite/domain/entity/favorite.dart';
import 'package:rinjani_visitor/features/favorite/domain/wishlist_repository.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final RemoteFavoriteSource remote;
  FavoriteRepositoryImpl(this.remote);

  @override
  Future<List<FavoriteEntity>> getFavorites(String token) async {
    developer.log("Get Favorites", name: runtimeType.toString());
      final result = await remote.getFavorites(token: token);
      if(result.data == null) return [];
      final list = result.data!.map((e) => e.toEntity()).toList();
      return list;
  }

  @override
  Future<bool?> toggleFavorite(String token, String productId) async {
    final body = ToggleFavoriteRequest(productId: productId);
    final result = await remote.toggleFavourites(token: token, body: body);
    if(result.data != null) {
        return true;
      }
      return false;
  }
}

final favoriteRepositoryProvider = Provider((ref) {
  final dio = ref.read(dioServiceProvider);
  return FavoriteRepositoryImpl(RemoteFavoriteSource(dio));
}
);
