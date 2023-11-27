import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class TokenModel {
  String accessToken;
  String refreshToken;
  TokenModel({required this.refreshToken, required this.accessToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
