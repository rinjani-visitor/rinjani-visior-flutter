import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class TokenModel {
  String accessToken;
  String refreshToken;
  String accessExpiredAt;
  TokenModel({
    required this.refreshToken,
    required this.accessToken,
    required this.accessExpiredAt,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
