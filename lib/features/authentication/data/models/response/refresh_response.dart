import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'refresh_response.g.dart';

@JsonSerializable()
class RefreshResponse extends BaseResponse<String?> {
  @JsonKey(name: "acessToken")
  final String accessToken;
  RefreshResponse(
      {required super.errors,
      required super.message,
      required super.data,
      required this.accessToken});

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshResponseToJson(this);
}
