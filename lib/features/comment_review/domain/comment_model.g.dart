// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      user: json['user'] as String,
      commentId: json['commentId'] as String,
      reviewScore: json['reviewScore'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'commentId': instance.commentId,
      'reviewScore': instance.reviewScore,
      'content': instance.content,
    };
