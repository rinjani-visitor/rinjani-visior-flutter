import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';
import 'package:rinjani_visitor/features/product/data/models/response.dart';

part 'remote.g.dart';

@RestApi(baseUrl: restApiBaseUrl)
abstract class ProductRemoteSource {
  factory ProductRemoteSource(Dio dio, {String? baseUrl}) =
      _ProductRemoteSource;

  @GET("/api/products")
  Future<ProductResponse> getProducts({
    @Header("Authorization") required String token,
    @Query("status") String? status,
    @Query("category") String? category,
    @Query("rating") String? rating,
  });
}
