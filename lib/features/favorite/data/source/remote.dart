import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';
import 'package:rinjani_visitor/features/favorite/data/models/request/request.dart';
import 'package:rinjani_visitor/features/favorite/data/models/response/response.dart';

part 'remote.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RemoteFavoriteSource {
  factory RemoteFavoriteSource(Dio dio, {String? baseUrl}) =
      _RemoteFavoriteSource;

  @GET("/api/users/favorite/all")
  Future<GetFavoriteResponse> getFavorites({
    @Header("Authorization") required String token,
  });

  @POST("/api/users/favorite")
  Future<ToggleFavoriteResponse> toggleFavourites({
    @Header("Authorization") required String token,
    @Body() required ToggleFavoriteRequest body,
  });
}
