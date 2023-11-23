import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'refresh_response.g.dart';

@JsonSerializable()
class RefreshResponse extends BaseResponse<String?> {
  RefreshResponse(
      {required super.errors, required super.message, required super.data});

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshResponseToJson(this);
}
