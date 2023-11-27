import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';

part 'refresh.g.dart';

@JsonSerializable()
class RefreshResponse extends BaseResponse<RefreshResponseBody?> {
  @JsonKey(name: "accessToken")
  String? accessToken;
  String? refreshToken;
  RefreshResponse(
      {required super.errors,
      required super.message,
      required super.data,
      required this.accessToken,
      required this.refreshToken});

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshResponseToJson(this);

  AuthEntity toEntity() => AuthEntity(
        userId: data?.userId,
        email: data?.email,
        username: data?.name,
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}

@JsonSerializable()
class RefreshResponseBody {
  final String? userId;
  final String? name;
  final String? email;

  RefreshResponseBody(
      {required this.userId, required this.name, required this.email});
  factory RefreshResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshResponseBodyToJson(this);
}
