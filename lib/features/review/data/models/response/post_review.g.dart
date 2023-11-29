// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReviewResponse _$PostReviewResponseFromJson(Map<String, dynamic> json) =>
    PostReviewResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : PostReviewBody.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostReviewResponseToJson(PostReviewResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'data': instance.data,
    };

PostReviewBody _$PostReviewBodyFromJson(Map<String, dynamic> json) =>
    PostReviewBody(
      reviewId: json['reviewId'] as int,
      messageReview: json['messageReview'] as String?,
      rating: json['rating'] as String?,
    );

Map<String, dynamic> _$PostReviewBodyToJson(PostReviewBody instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'messageReview': instance.messageReview,
      'rating': instance.rating,
    };
