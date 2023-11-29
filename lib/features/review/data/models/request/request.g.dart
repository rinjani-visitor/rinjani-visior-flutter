// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReviewRequest _$PostReviewRequestFromJson(Map<String, dynamic> json) =>
    PostReviewRequest(
      orderId: json['orderId'] as String,
      messageReview: json['messageReview'] as String,
      rating: json['rating'] as String,
    );

Map<String, dynamic> _$PostReviewRequestToJson(PostReviewRequest instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'messageReview': instance.messageReview,
      'rating': instance.rating,
    };
