// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadAvatarResponse _$UploadAvatarResponseFromJson(
        Map<String, dynamic> json) =>
    UploadAvatarResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$UploadAvatarResponseToJson(
        UploadAvatarResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
    };
