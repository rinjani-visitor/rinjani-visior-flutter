import 'package:json_annotation/json_annotation.dart';

part 'upload_avatar.g.dart';

@JsonSerializable()
class UploadAvatarResponse {
  final List<String>? errors;
  final String message;

  UploadAvatarResponse({required this.errors, required this.message});

  factory UploadAvatarResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadAvatarResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UploadAvatarResponseToJson(this);
}
