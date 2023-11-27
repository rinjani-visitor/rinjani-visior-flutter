// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserDetailResponse _$UpdateUserDetailResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateUserDetailResponse(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$UpdateUserDetailResponseToJson(
    UpdateUserDetailResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errors', instance.errors);
  val['message'] = instance.message;
  writeNotNull('data', instance.data);
  return val;
}
