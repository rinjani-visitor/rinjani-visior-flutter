import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  String user;
  String commentId;
  String reviewScore;
  String content;

  CommentModel(
      {required this.user,
      required this.content,
      required this.commentId,
      required this.reviewScore});

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}
