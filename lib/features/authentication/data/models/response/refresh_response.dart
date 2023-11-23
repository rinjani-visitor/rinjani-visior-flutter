import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';

part 'refresh_response.g.dart';

@JsonSerializable()
class RefreshResponse extends BaseResponse<RefreshResponseBody?> {
  @JsonKey(name: "acessToken")
  final String accessToken;
  final String refreshToken;
  RefreshResponse(
      {required super.errors,
      required super.message,
      required super.data,
      required this.accessToken,
      required this.refreshToken});

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshResponseToJson(this);
}

@JsonSerializable()
class RefreshResponseBody {
  final String userId;
  final String name;
  final String email;

  RefreshResponseBody(
      {required this.userId, required this.name, required this.email});
  factory RefreshResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshResponseBodyToJson(this);
}
