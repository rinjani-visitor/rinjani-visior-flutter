import 'package:rinjani_visitor/features/favorite/domain/entity/favorite.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteEntity>> getFavorites(String token);
  Future<bool?> toggleFavorite(String token, String productId);
}
