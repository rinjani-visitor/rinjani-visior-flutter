import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';
import 'package:rinjani_visitor/features/product/data/models/response/response.dart';

part 'remote.g.dart';

@RestApi(baseUrl: restApiBaseUrl)
abstract class ProductRemoteSource {
  factory ProductRemoteSource(Dio dio, {String? baseUrl}) =
      _ProductRemoteSource;

  @GET("/api/products")
  Future<ProductResponse> getProducts({
    @Header("Authorization") required String token,
    @Query("title") String? title,
    @Query("status") String? status,
    @Query("category") String? category,
    @Query("rating") String? rating,
  });

  @GET("/api/products/{category}/{id}")
  Future<ProductDetailResponse> getProductDetail({
    @Header("Authorization") required String token,
    @Path("category") required String category,
    @Path("id") required String id,
  });

  //TODO: GANTI ENPOINTNYA, TUNGGU KONFIRMASI DARI TIM BACKEND

}
