// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      user: json['user'] as String,
      content: json['content'] as String,
      commentId: json['commentId'] as String,
      reviewScore: json['reviewScore'] as String,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'commentId': instance.commentId,
      'reviewScore': instance.reviewScore,
      'content': instance.content,
    };
