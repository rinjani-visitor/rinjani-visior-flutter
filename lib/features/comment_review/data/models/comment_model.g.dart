// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      user: json['user'] as String,
      commentId: json['commentId'] as String,
      reviewScore: json['reviewScore'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'commentId': instance.commentId,
      'reviewScore': instance.reviewScore,
      'content': instance.content,
    };
