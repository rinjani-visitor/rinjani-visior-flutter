import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'post_review.g.dart';

@JsonSerializable()
class PostReviewResponse extends BaseResponse<PostReviewBody?> {
  PostReviewResponse(
      {required super.errors, required super.message, required super.data});

  factory PostReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$PostReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostReviewResponseToJson(this);
}

@JsonSerializable()
class PostReviewBody {
  final int reviewId;
  final String? messageReview;
  final String? rating;

  PostReviewBody({
    required this.reviewId,
    this.messageReview,
    this.rating,
  });

  factory PostReviewBody.fromJson(Map<String, dynamic> json) =>
      _$PostReviewBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PostReviewBodyToJson(this);
}
