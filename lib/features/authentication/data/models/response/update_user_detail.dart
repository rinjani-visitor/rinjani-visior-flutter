import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'update_user_detail.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateUserDetailResponse extends BaseResponse {
  UpdateUserDetailResponse(
      {required super.errors, required super.message, required super.data});
  factory UpdateUserDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserDetailResponseToJson(this);
}
