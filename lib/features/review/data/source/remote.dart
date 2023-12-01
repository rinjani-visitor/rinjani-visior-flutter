import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rinjani_visitor/core/constant/network.dart';
import 'package:rinjani_visitor/features/review/data/models/request/request.dart';
import 'package:rinjani_visitor/features/review/data/models/response/post_review.dart';

part 'remote.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RemoteReviewDataSource {
  factory RemoteReviewDataSource(Dio dio, {String? baseUrl}) =
      _RemoteReviewDataSource;

  @POST("/api/reviews")
  Future<PostReviewResponse> postReview(
    @Header("Authorization") String token,
    @Body() PostReviewRequest body,
  );
}
