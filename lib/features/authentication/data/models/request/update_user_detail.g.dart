// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserDetailRequest _$UpdateUserDetailRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserDetailRequest(
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$UpdateUserDetailRequestToJson(
    UpdateUserDetailRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('password', instance.password);
  writeNotNull('confirmPassword', instance.confirmPassword);
  return val;
}
